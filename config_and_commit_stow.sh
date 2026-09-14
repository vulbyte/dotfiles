#!/bin/bash

# 1. Save the starting directory
START_DIR=$(pwd)

# 2. Move to the dotfiles root to perform the work
echo "attempting to move to the dotfiles root"
cd "$HOME/dotfiles" || { echo "Could not find dotfiles directory"; exit 1; }

# 3. Clean macOS junk and conflicts
echo "cleaning .DS_Store files"
find . -type f \( -name '.DS_Store' \) -delete

# 4. Run stow targeting your .config directory from the root
echo "running stow for .config packages"
stow --target="$HOME/.config" .config

# 5. Global Git Config
echo "updating git config"
git config --global core.excludesfile "$HOME/.gitignore"

# 6. Git Sync (staging and committing all changes in the repo)
echo "backing up config"
git add .
git commit -m "automatic backup after obs was closed"
git push -u origin main

# 7. Return to the original directory
echo "returning to home dir"
cd "$START_DIR"

echo "Stow refreshed and backed up. Returned to $START_DIR"
