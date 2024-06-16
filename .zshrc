# these are my zsh path thingys, 
# this is made for macOS,
# ordered by application alphabetically

# TERMINTAL CUSTOMIZATION
    # export FOX=" 🦊 "
    # export DISPLAY="\h \t \$"

    # BELOW IS FOR BASH
    # export PS1 = `\h \t \$ `
    # export PS1=`$FOX $(date "+%H:%M:%S) $`

    # for more on customization go here: https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Prompt-Expansion

    BG1='%K{#ff0051}'                                               # background color
    FG1='%F{#ffffff}'                                               # foreground color
    FG2='%F{#ff0051}'                                               # background color
    BG2='%K{#ffffff}'                                               # foreground color
    CLEAR='%k%f'                                                    # clear the colors
    UN='￮'                                                          # username
    DIR='%3~/'                                                      # directory + depth
    PASSFAIL='%(?.✔ .✖ )%'                                         # shows the left symbol if pass, right if fail
    PERMS='%# '                                                     # if has elevated permissions will show a 
    NEW_L="\n"

    # find git branch of cur dir
    function find_git_branch(){
      branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
      if [[ $branch == "" ]];
      then
          echo '- '
      else
        echo '- ('$branch')'
      fi
    }

    # check for db in cur dir
    function database(){
        db=$()
        echo " - (NULL)"
    }

    # THE PROMPT IS HERE
    setopt PROMPT_SUBST
    PROMPT='${BG1}${FG1} ${UN} | ${DIR} | LAST_CMD: ${PASSFAIL} |  $(find_git_branch) ${CLEAR}${FG2}▋▋▌▍▎▏${CLEAR}'   # put it all together
    #  $(database) |
    #  ${PERMS}

    #RANDOM SYMBOLS:
    # █▉▊▋▌▍▎▏
    # ￮
    # ▶ ◤

# aliases
    # quick git commit     
    function qgit {                    
        datetime=$(date +'%Y-%m-%d %H:%M:%S')

        qgit_un=$(git config user.name)

        qgit_m="qgit @: $datetime, from user ${qgit_un}"  # Default commit message
        qgit_o="origin"             # Default origin
        qgit_y="false"              # Default skip confirms

        while getopts 'm:o:y' flag; do 
            case "${flag}" in 
                m)  qgit_m="${OPTARG}" ;;
                o)  qgit_o="${OPTARG}" ;;
                y)  qgit_y="${OPTARG}" ;;
                *) echo "unexpected option ${flag}"; return 1;;                 
            esac
        done

        # if -y flag applied, then hard send
        if [ "$qgit_y" = 'true' ]; then 
            git add .
            git commit -m "$qgit_m" 
            git push -u "$qgit_o"            
        else
            QGIT_FG2='\033[38;5;197m'  # Set foreground color to a shade of pink
            QGIT_BG2='\033[48;5;231m'  # Set background color to a shade of white
            QGIT_CLEAR='\033[0m'       # Clear colors

            QGIT_PROMPT="Would you like to commit to: ${QGIT_FG2}${qgit_o}${QGIT_CLEAR}\nwith the message: ${QGIT_FG2}${qgit_m}${QGIT_CLEAR} (y/n)"
            echo "${QGIT_PROMPT}"
            read yn

            case $yn in
                [Yy]* ) 
                    git add .
                    git commit -m "$qgit_m" 
                    git push -u "$qgit_o"
                    ;;
                [Nn]*) 
                    echo "Exiting"
                    ;;
                *) 
                    echo "Incorrect input detected, exiting" 
                    ;;
            esac
        fi
    }

# bc 
    export BC_ENV_ARGS="-l"

# bin
    export PATH="/usr/local/bin:$PATH"

# cpp
# BELOW WILL BREAK .ZSHRC
# export CPPFLAGS="-I/usr/local/opt/openjdk/include"

# homebrew stuff
    export PATH="/opt/homebrew/sbin:$PATH"
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="/opt/homebrew/bin:$PATH"
    export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/System/Library/Frameworks/Python:/usr/local/share/dotnet:~/.dotnet/tools:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/opt/homebrew/bin:/opt/homebrew/bin"

# java stuff
    # export PATH='/usr/local/opt/openjdk/bin:$PATH'

# mono/c#
    export PATH="/Library/Frameworks/Mono.framework/Versions/Current/Commands/msbuild:$PATH"
    export PATH="/Library/Frameworks/Mono.framework/Versions/Current/bin:$PATH"

# pico stuff
    export PICO_SDK_PATH="/opt/homebrew/bin/cmake"

# pyenv
    export PYENV_ROOT="/opt/homebrew/bin/pyenv"


# pnpm
    export PNPM_HOME="~/Library/pnpm"
    case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
    esac

# rust/cargo
    # export PATH="$HOME/.cargo/bin:$PATH"
    # export PATH="$Path:/Users/insert/.cargo/bin"
    export PATH="$PATH:/opt/homebrew/bin/cargo"
    export PATH="$PATH:/Users/insert/.cargo/bin"
    # cargo 2 electic boogaloo
    # export PATH="/Users/insert/.cargo/bin:$PATH"
