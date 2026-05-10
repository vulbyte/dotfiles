#!/bin/bash

# 1. Setup Paths
OS_TYPE=$(uname)
if [ "$OS_TYPE" == "Darwin" ]; then
    OBS_TARGET="$HOME/Library/Application Support/obs-studio"
else
    OBS_TARGET="$HOME/.config/obs-studio"
fi

BACKUP_PATH="$HOME/dotfiles/obs-studio-backup"

# 2. Safety Check
if [ ! -d "$BACKUP_PATH" ]; then
    echo "ERROR: Backup not found at $BACKUP_PATH"
    echo "Please ensure your files are backed up before running this."
    exit 1
fi

# 3. The Deletion
echo "Preparing to delete local config at: $OBS_TARGET"
read -p "Are you sure you want to proceed? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Remove the local folder entirely
    rm -rf "$OBS_TARGET"
    
    # Also clean up pesky macOS metadata that blocks Stow
    find "$HOME/dotfiles" -name ".DS_Store" -delete
    
    echo "Local config cleared. You are ready to test 'stow'."
else
    echo "Operation cancelled."
fi
