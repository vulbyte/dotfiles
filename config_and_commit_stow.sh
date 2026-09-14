#!/bin/bash
set -euo pipefail

START_DIR=$(pwd)
DOTFILES="$HOME/dotfiles"

echo "Cleaning .DS_Store files..."
find "$DOTFILES" -type f -name '.DS_Store' -delete

echo "Running stow..."
stow -R -d "$DOTFILES" -t "$HOME" home

echo "Updating git config..."
git config --global core.excludesfile "$DOTFILES/.gitignore"

echo "Backing up config to git..."
cd "$DOTFILES"
git add -A
if git diff --cached --quiet; then
    echo "No changes to commit."
else
    git commit -m "incremental dotfiles backup $(date)"
fi
git push

cd "$START_DIR"
echo "Stow refreshed and backed up."
