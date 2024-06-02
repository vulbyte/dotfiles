# this file is meant to clean my directory of annoying files then commit, simply to make life easier

# remove all .DS_Store files
find . -type f \( -name '.DS_Store' -or -name '*text*' \) -delete;

# commit the stow
stow .;
