gitq_o = ''; # qgit -o (for origin)
gitq_m = ''; # qgit -m (for message)
alias qgit = function git_commit(){
    while getopts 'abd:v' flag; 
    do 
        case "${flag}" in 
            gitq_o='origin';
            if (gitq_m == ''){
                datetime = $(date +'%Y-%m-%d %H:%M:%S')
                gitq_m=$(echo 'qgit @: ' $datetime)
            }
            fi

    $(git add .);
    $(git commit -m `gitq_m`);
    $(git push -u `gitq_o`)
}
