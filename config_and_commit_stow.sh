#!/bin/bash

# 1. Save the starting directory
START_DIR=$(pwd)

# 2. Clean macOS junk directly in the dotfiles folder
echo "Cleaning .DS_Store files..."
find "$HOME/dotfiles" -type f \( -name '.DS_Store' \) -delete

# 3. Move to HOME to run Stow natively
echo "Running stow..."
cd "$HOME" || { echo "Could not move to home"; exit 1; }

# Treat the 'dotfiles' folder as the package. 
# -R (--restow) ensures it refreshes existing links and adds new ones (like .agents)
stow -R dotfiles

# 4. Global Git Config
echo "Updating git config..."
git config --global core.excludesfile "$HOME/dotfiles/.gitignore"

# 5. Git Sync
echo "Backing up config to git..."
cd "$HOME/dotfiles" || { echo "Could not move to dotfiles"; exit 1; }
git add .
git commit -m "automatic backup after config update"
git push -u origin main

# 6. Return to start
echo "Returning to original directory..."
cd "$START_DIR"

echo "Stow refreshed and backed up."
