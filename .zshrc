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

BG='%K{#000000}'                                            # background color
FG='%F{#ff0051}'                                            # foreground color
CLEAR='%k%f'                                                # clear the colors
UN='🦊 '                                                    # username
DIR='%3~ '                                                  # directory + depth
PASSFAIL='%(?.✔️ .𝕏 )% '                                     # shows the left symbol if pass, right if fail
PERMS='%# '                                                 # if has elevated permissions will show a 
PROMPT="${UN}@ ${BG}${FG}${DIR}$CLEAR${PASSFAIL}${PERMS}"   # put it all together


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
# cargo 2 electic boogaloo
# export PATH="/Users/insert/.cargo/bin:$PATH"
