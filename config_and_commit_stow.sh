#!/bin/bash

# 1. Save the starting directory
START_DIR=$(pwd)

# 2. Move to the dotfiles root to perform the work
echo "attempting to move to the dotfiles root"
cd "$HOME/dotfiles" || { echo "Could not find dotfiles directory"; exit 1; }

# 3. Clean macOS junk
echo "cleaning .DS_Store files"
find . -type f \( -name '.DS_Store' \) -delete

# 4. Enable dotglob so hidden folders (like .agents and .config) are matched
shopt -s dotglob

# 5. Loop through every folder/file in dotfiles and stow it into $HOME
echo "running stow for all dotfiles packages..."
for pkg in */; do
    pkg_name="${pkg%/}"
    
    # Skip .git and any current/parent markers
    if [[ "$pkg_name" != ".git" && "$pkg_name" != "." && "$pkg_name" != ".." ]]; then
        echo "Stowing: $pkg_name"
        stow --target="$HOME" "$pkg_name"
    fi
done

# Disable dotglob afterwards
shopt -u dotglob

# 6. Global Git Config
echo "updating git config"
git config --global core.excludesfile "$HOME/.gitignore"

# 7. Git Sync (staging and committing all changes in the repo)
echo "backing up config"
git add .
git commit -m "automatic backup after config update"
git push -u origin main

# 8. Return to the original directory
echo "returning to home dir"
cd "$START_DIR"

echo "Stow refreshed and backed up. Returned to $START_DIR"
