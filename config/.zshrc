# Set up the prompt

export TERM="xterm-256color"
fpath+=($HOME/.zsh/pure)
autoload -Uz promptinit
promptinit
# prompt adam1
zstyle :prompt:pure:path color yellow
# zstyle ':prompt:pure:prompt:*' color red
zstyle ':prompt:pure:prompt:*' color yellow
zstyle :prompt:pure:git:stash show yes
prompt pure

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

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # ZSH_HOME="/usr/share"
    ZSH_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
    [ -f "${ZSH_HOME}/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && . ${ZSH_HOME}/zsh-autosuggestions/zsh-autosuggestions.zsh
    [ -f "${ZSH_HOME}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && . ${ZSH_HOME}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    [ -f "${ZSH_HOME}/autojump/autojump.zsh" ] && . ${ZSH_HOME}/autojump/autojump.zsh
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
    [ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && . /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && . /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi
bindkey '^ ' autosuggest-accept


if [[ "$OSTYPE" == "darwin"* ]]; then
    PATH="${XDG_DATA_HOME:-$HOME}/works/platform-tools:/usr/local/opt/node@18/bin:/usr/local/opt/openjdk/bin:$PATH"
else
    PATH="${XDG_DATA_HOME:-$HOME/.local/bin}:${XDG_DATA_HOME:-$HOME}/works/stmgen:${XDG_DATA_HOME:-$HOME/works/working-in-wsl/tools/}:$PATH"
fi


# 状态机生成器
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export STMGEN_JAR_PATH="${XDG_DATA_HOME:-$HOME}"/works/stmgen/tsd.common.tools.stmgen.jar
  export PATH_STMGEN_JAR="${XDG_DATA_HOME:-$HOME}"/works/stmgen/tsd.common.tools.stmgen.jar
  export EA_STM_EXPORT_FILE="${XDG_DATA_HOME:-$HOME}"/works/stmgen/export.xml
fi

################################################################################
# DISPLAY X11 Server
################################################################################
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export HOST_GW=`awk '/nameserver/{print $2}' /etc/resolv.conf`
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export HOST_GW='127.0.0.1'
fi
# export DISPLAY=${HOST_GW}:1.0
# export DISPLAY=${HOST_GW}:0

alias set-proxy="export https_proxy=http://${HOST_GW}:20170 http_proxy=http://${HOST_GW}:20170 all_proxy=socks5://${HOST_GW}:20170"

export EDITOR=nvim
export SVN_EDITOR=nvim
alias ll="ls -ahl"
alias vi=nvim
alias vim=nvim
alias v=nvim 
alias adb=adb.exe

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


