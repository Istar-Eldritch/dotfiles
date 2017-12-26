# Run tmux when new terminal is created
[[ $TERM != "screen-256color" ]] && exec tmux attach


# Plugin Manager
source ~/.zplug/init.zsh
zplug "zplug/zplug", hook-build: 'zplug --self-manage'

# Load the oh-my-zsh's library.
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/pass", from:oh-my-zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "rust-lang/zsh-config"
zplug "potasiyam/cmder-zsh-theme", as:theme

if ! zplug check; then
  zplug install
fi

zplug load


# ZSH bindkeys
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward


bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# ZSH in vi mode
bindkey -v

function zle-line-init zle-keymap-select {
  if [ $KEYMAP = vicmd ]; then
      # the command mode for vi
      echo -ne "\e[2 q"
  else
      # the insert mode for vi
      echo -ne "\e[5 q"
  fi
}

# sessionfile=`find "${HOME}/.dbus/session-bus/" -type f`
# export `grep "DBUS_SESSION_BUS_ADDRESS" "${sessionfile}" | sed '/^#/d'`

zle -N zle-line-init
zle -N zle-keymap-select

# Use vim as editor
export EDITOR='vim'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

export PATH=$PATH:~/.local/bin:~/.cargo/bin

# Rust
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# NVM ON Linux
export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GPG_TTY=`tty`

##
# AWS Credentials
##

function setupAWS() {
  if [ "$1" = "--unset" ]
  then
    unset AWS_ACCESS_KEY
    unset AWS_SECRET_ACCESS_KEY
  else
    export AWS_ACCESS_KEY=$(pass show repositive/aws/access)
    export AWS_SECRET_ACCESS_KEY=$(pass show repositive/aws/secret)
  fi
}

##
# Kubernetes Specific
##

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)

  function kenv() {
    if [ "$1" != "" ]
    then
      setupAWS
      export KOPS_STATE_STORE="s3://k8s-$1-state-store"
      if [ "$1" = "production" ]
      then
        export KOPS_STATE_STORE="s3://k8s-$1-state-store-repositive"
      fi
      kops export kubecfg "k8s-$1.repositive.io"
    else
      setupAWS --unset
      unset KOPS_STATE_STORE
    fi
  }

fi

##
# Docker & Docker Machine Specific
##

if [ $commands[docker-machine] ]; then
  function dme() {
    if [ "$1" != "" ]
    then
       setupAWS
       eval $(docker-machine env "$1");
    else
      setupAWS --unset
      eval $(docker-machine env --unset);
    fi
  }
fi

if [[ $TERM = dumb ]]; then
  unset zle_bracketed_paste
fi

# 10ms for key sequences
KEYTIMEOUT=1

# Aliases
alias clip='xclip -sel clip'

if [ $commands[emacs] ]; then
  function ems() {
    emacsclient -nw $1 || (emacs --daemon && ems $1)
  }
fi

if [ $commands[docker] ]; then
  alias drun='docker run -it --network=host --rm -v $(pwd):/opt/work --workdir=/opt/work'
  alias psql='drun postgres:9.5 psql'
  alias pg_dump='drun postgres:9.5 pg_dump'
  alias pnode='docker exec -it pnode'
  alias iris='pnode iris'
fi

if [ $commands[docker-compose] ]; then
  alias dc='docker-compose'
  alias dcu='dc up'
fi

if [ $commands[exa] ]; then
  alias ls='exa -lh'
fi

# History opts
export HISTFILE=~/.histfile
export SAVEHIST=1000000
export HISTSIZE=1000000
setopt inc_append_history
setopt share_history

