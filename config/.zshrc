# Set up the prompt

# export TERM="xterm-256color"
autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/autojump/autojump.zsh

if [ -e "${XDG_DATA_HOME:-$HOME/.local/bin}"/gitdiffall.zsh ]; then
  source  "${XDG_DATA_HOME:-$HOME/.local/bin}"/gitdiffall.zsh
fi

bindkey '^ ' autosuggest-accept

PATH="${XDG_DATA_HOME:-$HOME/.local/bin}:/home/lv/works/stmgen:${XDG_DATA_HOME:-$HOME/works/system_config/tools/}:$PATH"


# export STMGEN_JAR_PATH=/home/StmGen (放置stmgen.jar文件的路径) /tsd.common.tools.stmgen.jar
export STMGEN_JAR_PATH="${XDG_DATA_HOME:-$HOME}"/works/stmgen/tsd.common.tools.stmgen.jar
export EA_STM_EXPORT_FILE="${XDG_DATA_HOME:-$HOME}"/works/stmgen/export.xml

export DISPLAY=${HOST_GW}:1.0
# Add "serarch suffix" for Joynext
"${XDG_DATA_HOME:-$HOME}"/adddns.sh

# Following is for WSL only
################################################################################

export HOST_GW=`ip route |awk '/default/{print $3}'`
export EDITOR=nvim
export SVN_EDITOR=nvim
alias ll="ls -ahl"
alias vi=nvim 
alias vim=nvim
alias v=nvim 

# alias adb=adb.exe
# alias set-proxy="export https_proxy=http://${HOST_GW}:20170 http_proxy=http://${HOST_GW}:20170 all_proxy=socks5://${HOST_GW}:20170"
# if [ "`git config --global --get proxy.https`" != "socks5://${HOST_GW}:20170" ]; then
# 	git config --global proxy.https socks5://${HOST_GW}:20170
# fi
# 
# 不使用Docker-Desktop，默认启动Docker服务
# DOCKER_DISTRO="Ubuntu"
# DOCKER_DIR=/mnt/wsl/shared-docker
# DOCKER_SOCK="$DOCKER_DIR/docker.sock"
# export DOCKER_HOST="unix://$DOCKER_SOCK"
# if [ ! -S "$DOCKER_SOCK" ]; then
   # mkdir -pm o=,ug=rwx "$DOCKER_DIR"
   # sudo chgrp docker "$DOCKER_DIR"
   # /mnt/c/Windows/System32/wsl.exe -d $DOCKER_DISTRO sh -c "nohup sudo -b dockerd < /dev/null > $DOCKER_DIR/dockerd.log 2>&1"
# fi

