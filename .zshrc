# these are my zsh path thingys, 
# this is made for macOS,
# ordered by application alphabetically

# bc 
export BC_ENV_ARGS="-l"

# bin
export PATH="/usr/local/bin:$PATH"

# rust/cargo
# export PATH="$HOME/.cargo/bin:$PATH"
# export PATH="$Path:/Users/insert/.cargo/bin"
export PATH="$PATH:/opt/homebrew/bin/cargo"
# cargo 2 electic boogaloo
# export PATH="/Users/insert/.cargo/bin:$PATH"

# mono/c#
export PATH="/Library/Frameworks/Mono.framework/Versions/Current/Commands/msbuild:$PATH"
export PATH="/Library/Frameworks/Mono.framework/Versions/Current/bin:$PATH"

# pico stuff
export PICO_SDK_PATH="/opt/homebrew/bin/cmake"

# homebrew stuff
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/System/Library/Frameworks/Python:/usr/local/share/dotnet:~/.dotnet/tools:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/opt/homebrew/bin:/opt/homebrew/bin"

# pnpm
export PNPM_HOME="~/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
