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
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  eval "$(dircolors -b)"
fi
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

bindkey '^ ' autosuggest-accept

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # ZSH_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
    ZSH_HOME=/usr/share
    source ${ZSH_HOME}/zsh-autosuggestions/zsh-autosuggestions.zsh
    source ${ZSH_HOME}/powerlevel9k/powerlevel9k.zsh-theme
    source ${ZSH_HOME}/autojump/autojump.zsh
    source ${ZSH_HOME}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
    ZSH_HOME=/usr/local/share
    [ -f /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme ] && . /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
    [ -f ${ZSH_HOME}/zsh-autosuggestions/zsh-autosuggestions.zsh ] && . ${ZSH_HOME}/zsh-autosuggestions/zsh-autosuggestions.zsh
    [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
    [ -f ${ZSH_HOME}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]&& . ${ZSH_HOME}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -e "${XDG_DATA_HOME:-$HOME/.local/bin}"/gitdiffall.zsh ]; then
  source  "${XDG_DATA_HOME:-$HOME/.local/bin}"/gitdiffall.zsh
fi

# Add "serarch suffix" for Joynext
if [ -e "${XDG_DATA_HOME:-$HOME}"/.adddns.sh ]; then
  "${XDG_DATA_HOME:-$HOME}"/.adddns.sh
fi

PATH="${XDG_DATA_HOME:-$HOME/.local/bin}:/home/lv/works/stmgen:${XDG_DATA_HOME:-$HOME/works/working-in-wsl/tools/}:${XDG_DATA_HOME:-$HOME/works/system_config/tools/}:$PATH"


if [[ "$OSTYPE" == "darwin"* ]]; then
PATH="/Users/lvhaobo/works/platform-tools:/usr/local/opt/openjdk/bin:$PATH"

fi
# export STMGEN_JAR_PATH=/home/StmGen (放置stmgen.jar文件的路径) /tsd.common.tools.stmgen.jar
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export STMGEN_JAR_PATH="${XDG_DATA_HOME:-$HOME}"/works/stmgen/tsd.common.tools.stmgen.jar
  export EA_STM_EXPORT_FILE="${XDG_DATA_HOME:-$HOME}"/works/stmgen/export.xml
fi

# export DISPLAY=${HOST_GW}:1.0

# Following is for WSL only
################################################################################
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export HOST_GW=`ip route |awk '/default/{print $3}'`
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export HOST_GW='127.0.0.1'
fi
alias set-proxy="export https_proxy=http://${HOST_GW}:20170 http_proxy=http://${HOST_GW}:20170 all_proxy=socks5://${HOST_GW}:20170"

export EDITOR=nvim
export SVN_EDITOR=nvim
alias ll="ls -ahl"
alias vi=nvim 
alias vim=nvim
alias v=nvim 


# alias adb=adb.exe

# if [ "`git config --global --get proxy.https`" != "socks5://${HOST_GW}:20170" ]; then
# 	git config --global proxy.https socks5://${HOST_GW}:20170
# fi
 

# 不使用Docker-Desktop，默认启动Docker服务
# DOCKER_DISTRO="Ubuntu"
# DOCKER_DIR=/mnt/wsl/shared-docker
# DOCKER_SOCK="$DOCKER_DIR/docker.sock"
# export DOCKER_HOST="unix://$DOCKER_SOCK"
# if [ ! -S "$DOCKER_SOCK" ]; then
#    mkdir -pm o=,ug=rwx "$DOCKER_DIR"
#    sudo chgrp docker "$DOCKER_DIR"
#    /mnt/c/Windows/System32/wsl.exe -d $DOCKER_DISTRO sh -c "nohup sudo -b dockerd < /dev/null > $DOCKER_DIR/dockerd.log 2>&1"
# fi

