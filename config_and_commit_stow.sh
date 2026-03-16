# just a file to deal with the same annoying things then commit the stow

# delete macOS .DS_Store files because they create commit conflicts with stow
find . -type f \( -name '.DS_Store' -or -name '*text*' \) -delete;

# commit the stow
stow .;

# add global git ignore
git config --global core.excludesfile ~/.gitignore
