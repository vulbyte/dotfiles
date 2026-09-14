#!/bin/bash

# 1. Save the starting directory
START_DIR=$(pwd)

# 2. Move to the dotfiles root to perform the work
echo "attempting to move to the dotfiles root"
cd "$HOME/dotfiles/obs-studio" || { echo "Could not find dotfiles directory"; exit 1; }

# 3. Clean macOS junk and conflicts
echo "cleaning .DS_Store files"
find . -type f \( -name '.DS_Store' \) -delete

# 4. Clear the current system-level links
echo "clearing symlinks"
rm -rf "$HOME/Library/Application Support/obs-studio"
rm -rf "$HOME/.config/obs-studio"

# 5. Run stow from the package root pointing to your home directory
echo "running stow"
stow --target="$HOME" .

# 6. Global Git Config
echo "updating git config"
git config --global core.excludesfile "$HOME/.gitignore"

# 7. Git Sync (moving up to the repo root to capture all changes)
echo "backing up config"
cd "$HOME/dotfiles"
git add .
git commit -m "automatic backup after obs was closed"
git push -u origin main

# 8. Return to the original directory
echo "returning to home dir"
cd "$START_DIR"

echo "Stow refreshed and backed up. Returned to $START_DIR"
