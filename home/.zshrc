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
    # alias nvim="nvim ./"
    alias factors_of="/Volumes/970p2tb/projects/0000-mathStuff/factors_of.out";

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
            git add . -p
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

#cpath 
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

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
    # export PATH="/Users/insert/Library/Python/3.11/bin"

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

#ti84 plus ce
	export PATH=~/CEdev/bin:$PATH
	# Suppress message about using zsh
	
# z88dk
#export BASH_SILENCE_DEPRECATION_WARNING=1

# Export z88dk path and environment
export PATH=${PATH}:${HOME}/z88dk/bin
export ZCCCFG=${HOME}/z88dk/lib/config

# #molten-vk
# export VK_ICD_FILENAMES=$(brew --prefix molten-vk)/etc/vulkan/icd.d/MoltenVK_icd.json
# 
# # vulkan
# # Sets up required variables for Vulkan
# 
# SCRIPT_DIR=`dirname "$0"`
# MOLTENVK_VERSION="vulkansdk-macos-1.1.154.0"
# # MOLTENVK_VERSION="vulkansdk-macos-1.1.101.0"
# 
# # Path to SDK, once this is setup you can load vulkan in cmake with find_package(vulkan REQUIRED)
# # Later need to link project with "Vulkan::Vulkan"
# export VULKAN_SDK=$SCRIPT_DIR/LunarG-Vulkan-SDK/$MOLTENVK_VERSION/macOS
# echo "Setting VULKAN_SDK=`echo $VULKAN_SDK`"
# 
# # MoltenVK framework path
# export MOLTEN_VK=$SCRIPT_DIR/LunarG-Vulkan-SDK/$MOLTENVK_VERSION/MoltenVK
# echo "Setting MOLTEN_VK=`echo $MOLTEN_VK`"
# 
# # Path to vulkan binaries
# export PATH=$VULKAN_SDK/bin:$PATH
# 
# # Path to ICD
# export VK_ICD_FILENAMES=$VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json
# echo "Setting VK_ICD_FILENAMES=`echo $VK_ICD_FILENAMES`"
# 
# # Path to layers
# export VK_LAYER_PATH=$VULKAN_SDK/share/vulkan/explicit_layer.d
# echo "Setting VK_LAYER_PATH=`echo $VK_LAYER_PATH`"
# 
# # Path to Dynamic library
# export DYLD_LIBRARY_PATH=$VULKAN_SDK/lib:$DYLD_LIBRARY_PATH
# echo "Setting DYLD_LIBRARY_PATH=`echo $DYLD_LIBRARY_PATH`"
# 
# # Access to MoltenVK framework?
# export VULKAN_FRAMEWORK_PATH=$VULKAN_SDK/Frameworks
# echo "Setting VULKAN_FRAMEWORK_PATH=`echo $VULKAN_FRAMEWORK_PATH`"
# 
# # Path to Dynamic framworks
# export DYLD_FRAMEWORK_PATH=$VULKAN_FRAMEWORK_PATH:$DYLD_FRAMEWORK_PATH
# echo "Setting DYLD_FRAMEWORK_PATH=`echo $DYLD_FRAMEWORK_PATH`"
# 
# # Added by LM Studio CLI (lms)
# export PATH="$PATH:/Users/insert/.cache/lm-studio/bin"
# export PATH="/usr/local/sbin:$PATH"
