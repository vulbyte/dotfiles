gitq_m = ''; # qgit -m (for message)
gitq_o = ''; # qgit -o (for origin)
gitq_y = ''; # qgit -y (for skip confirms)
alias qgit = function git_commit(){                    


    # check flags
    while getopts 'abd:v' flag; do 
        case "${flag}" in 
            m) gitq_m = "qgit @:  $datetime";;
            o) gitq_o = 'origin';;
            y) gitq_y = '';;
            *) error "unexpected option ${{flag}";;
            
            
            if (gitq_m == ''){
                datetime = $(date +'%Y-%m-%d %H:%M:%S')
                gitq_m=$(echo 'qgit @: ' $datetime)
            }
            fi
        esac
    done

    # if -y flag applied, then hard send
    if(y == 'true'){
        $(git add .); $(git commit -m `gitq_m`); $(git push -u `gitq_o`);
    }
    fi
    else {
        datetime = $(date +'%Y-%m-%d %H:%M:%S')

        read -p "would you like to commit to: ${gitq_o} with the meddage: ${datetime} (y/n)"

        select yn in "y" "n"; do
            case $yn in
                y) $(git add .); $(git commit -m `gitq_m`); $(git push -u `gitq_o`);;
                n) exit;;
                *) echo "incorrect input detected" 
            esac
        done
    }
}
