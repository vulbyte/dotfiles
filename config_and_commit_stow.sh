#!/bin/bash

# 1. Save the starting directory
START_DIR=$(pwd)

# 2. Move to the dotfiles root to perform the work
# Using the specific nested folder where your 'Library' and '.config' actually live
cd "$HOME/dotfiles/obs-studio" || { echo "Could not find dotfiles directory"; exit 1; }

# 3. Clean macOS junk and conflicts
find . -type f \( -name '.DS_Store' -or -name '*text*' \) -delete

# 4. Clear the current system-level links
rm -rf "$HOME/Library/Application Support/obs-studio"
rm -rf "$HOME/.config/obs-studio"

# 5. Run stow from the package root
# This ensures Library/ maps to ~/Library/
stow --target="$HOME" .

# 6. Global Git Config
git config --global core.excludesfile "$HOME/.gitignore"

# 7. Git Sync (moving up to the repo root to capture all changes)
cd "$HOME/dotfiles"
git add .
git commit -m "automatic backup after obs was closed"
git push -u origin main

# 8. Return to the original directory
cd "$START_DIR"

echo "Stow refreshed and backed up. Returned to $START_DIR"
