# Define paths for convenience
if [[ "$(uname)" == "Darwin" ]]; then
    OBS_SRC="$HOME/Library/Application Support/obs-studio"
else
    OBS_SRC="$HOME/.config/obs-studio"
fi
DOTFILES_OBS="$HOME/dotfiles/obs-studio-backup"

# Create the dotfiles directory
mkdir -p "$DOTFILES_OBS"

# Move the safe files into dotfiles
rsync -av \
    --exclude='logs/' \
    --exclude='crashes/' \
    --exclude='thumbnails/' \
    --exclude='obs-browser/' \
    --exclude='service.json' \
    "$OBS_SRC/" "$DOTFILES_OBS/"
