#!/bin/bash

# 1. Detect Operating System
OS_TYPE=$(uname)
DOTFILES_DIR="$HOME/dotfiles"
GIT_BRANCH="main"

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
# Using --delete ensures files removed in OBS are also removed in your dotfiles
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

# 4. Git Backup Logic
echo "Checking for changes to backup to Git..."
cd "$DOTFILES_DIR" || exit

# Stage all changes (including the newly synced OBS files)
git add .

# Check if there are changes worth committing
if ! git diff-index --quiet HEAD; then
    echo "Changes detected. Committing and pushing..."
    git commit -m "obs: auto-sync $(date +'%Y-%m-%d %H:%M:%S')"
    git push origin "$GIT_BRANCH"
    echo "Backup to Git origin complete."
else
    echo "No changes detected. Git repository is already up to date."
fi

echo "---------------------------------------------------"
echo "Process finished."
