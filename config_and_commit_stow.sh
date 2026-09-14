#!/bin/bash

# 1. Save the starting directory
START_DIR=$(pwd)

# 2. Move to the dotfiles root to perform the work
echo "Moving to dotfiles root..."
cd "$HOME/dotfiles" || { echo "Could not find dotfiles directory"; exit 1; }

# 3. Clean macOS junk
echo "Cleaning .DS_Store files..."
find . -type f \( -name '.DS_Store' \) -delete

# 4. Run Stow for the entire repository
echo "Running stow to mirror everything to $HOME..."
# By passing '.', we tell stow the entire current directory is the package.
stow --target="$HOME" .

# 5. Global Git Config
echo "Updating git config..."
git config --global core.excludesfile "$HOME/.gitignore"

# 6. Git Sync (staging and committing all changes in the repo)
echo "Backing up config to git..."
git add .
git commit -m "automatic backup after config update"
git push -u origin main

# 7. Return to the original directory
echo "Returning to home dir..."
cd "$START_DIR"

echo "Stow refreshed and backed up. Returned to $START_DIR"
