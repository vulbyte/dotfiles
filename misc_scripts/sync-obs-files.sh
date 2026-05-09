#!/bin/bash

# 1. Detect Operating System
OS_TYPE=$(uname)
DOTFILES_DIR="$HOME/dotfiles"

if [ "$OS_TYPE" == "Darwin" ]; then
    # macOS Path
    OBS_SRC="$HOME/Library/Application Support/obs-studio/"
    DOTFILES_DEST="$DOTFILES_DIR/obs-studio/Library/Application Support/obs-studio"
elif [ "$OS_TYPE" == "Linux" ]; then
    # Linux Path
    OBS_SRC="$HOME/.config/obs-studio/"
    DOTFILES_DEST="$DOTFILES_DIR/obs-studio/.config/obs-studio"
else
    echo "Unsupported OS: $OS_TYPE"
    exit 1
fi

# 2. Create the destination directory structure
mkdir -p "$DOTFILES_DEST"

echo "Detected $OS_TYPE. Syncing OBS configuration..."

# 3. Sync files while excluding sensitive and bloated data
# Using --delete ensures files removed in OBS are removed in dotfiles
rsync -av --delete \
    --exclude='logs/' \
    --exclude='crashes/' \
    --exclude='plugin_config/' \
    --exclude='updates/' \
    --exclude='thumbnails/' \
    --exclude='profiler_data/' \
    --exclude='obs-browser/' \
    --exclude='shader-cache/' \
    --exclude='SafeModeFinished' \
    --exclude='*.bak' \
    --exclude='service.json' \
    "$OBS_SRC" "$DOTFILES_DEST"

# 4. Git Logic
echo "Checking for changes to push to Git..."
cd "$DOTFILES_DIR" || exit

# Add all changes in the dotfiles repo
git add .

# Only commit and push if there are actual changes
if ! git diff-index --quiet HEAD; then
    git commit -m "obs: auto-sync $(date +'%Y-%m-%d %H:%M:%S')"
    git push origin main
    echo "Changes pushed to origin successfully."
else
    echo "No changes detected. Git is already up to date."
fi
