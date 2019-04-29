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
zplug "rust-lang/cargo"
zplug "Istar-Eldritch/dotfiles", use:completions/rustup
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
export EDITOR='nvim'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

export PATH=$PATH:~/.local/bin:~/.cargo/bin

# Rust
if [ $commands[rustc] ]; then
  export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi

# NVM ON Linux
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/install-nvm-exec" ] && \. "$NVM_DIR/install-nvm-exec" # TODO: Not sure what this loads
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GPG_TTY=`tty`

##
# Kubernetes Specific
##
# The next line enables shell command completion for gcloud.
if [ -f '/home/istar/.local/opt/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/istar/.local/opt/google-cloud-sdk/completion.zsh.inc'; fi
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/istar/.local/opt/google-cloud-sdk/path.zsh.inc' ]; then source '/home/istar/.local/opt/google-cloud-sdk/path.zsh.inc'; fi

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

if [[ $TERM = dumb ]]; then
  unset zle_bracketed_paste
fi

# 10ms for key sequences
KEYTIMEOUT=1

# Aliases
alias clip='xclip -sel clip'

alias pubip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"

if [ $commands[docker] ]; then
  alias dmem='docker stats $(docker ps --format={{.Names}})'
  alias drun='docker run -it -u $UID --network=host --rm -v $(pwd):/opt/work --workdir=/opt/work'

  export DOCKER_REGISTRY=registry.repositive.io:5000
  export DOCKER_REGISTRY_CREDENTIAL_PATH="repositive/registry"
  function registry() {
    AUTH_HEADER="Authorization: Basic $(printf "$(pass $DOCKER_REGISTRY_CREDENTIAL_PATH/user):$(pass $DOCKER_REGISTRY_CREDENTIAL_PATH/password)" | base64)"
    if [ "$1" == "catalog" ]; then
      curl -H $AUTH_HEADER https://$DOCKER_REGISTRY/v2/_catalog
    elif [ "$1" == "tags" ]; then
      curl -H $AUTH_HEADER https://$DOCKER_REGISTRY/v2/$2/tags/list
    fi
  }
fi

if [ $commands[docker-compose] ]; then
  alias dc='docker-compose'
  alias dcu='dc up'
fi

if [ $commands[exa] ]; then
  alias ls='exa -lh'
fi

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# History opts
export HISTFILE=~/.histfile
export SAVEHIST=1000000
export HISTSIZE=1000000
export UID=$UID
setopt inc_append_history
setopt share_history


# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# [ -f ~/emsdk-portable/emsdk_env.sh ] && source ~/emsdk-portable/emsdk_env.sh
