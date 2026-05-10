# just a file to deal with the same annoying things then commit the stow

# delete macOS .DS_Store files because they create commit conflicts with stow
find . -type f \( -name '.DS_Store' -or -name '*text*' \) -delete;

# clear the current obs config 
rm -rf ~/Library/Application\ Support/obs-studio
rm -rf ~/.config/obs-studio

# commit the stow
stow .;

# add global git ignore
git config --global core.excludesfile ~/.gitignore

# back up to be safe
git add *;
git commit -m "automatic backup after obs was closed";
git push -u origin;

echo "stow has been backup";
