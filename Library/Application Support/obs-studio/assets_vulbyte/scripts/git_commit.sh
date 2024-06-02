# obs shutdown sh

echo "🦊🦊🦊 running the git_commit.sh file";

# move to the proper directory, making it absolute to prevent horrible unintented errors
cd /Users/insert/dotfiles;

# you should know these
git add .;
git commit -m "automatic git backup made on obs shutdown";
git push -u origin;
