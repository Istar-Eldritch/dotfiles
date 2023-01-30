# Run tmux when new terminal is created
if [ "$TERM" != "tmux-256color" ]; then
    exec tmux attach
else
  TERM=xterm-256color
  # zplug_start=`date +%s.%N`
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
  # zplug_end=`date +%s.%N`

  # echo "Zplug Time: $((zplug_end-zplug_start))"

  # ZSH bindkeys
  bindkey "^[[A" history-beginning-search-backward
  bindkey "^[[B" history-beginning-search-forward


  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down

  # ZSH in vi mode
  bindkey -v
  # Shows a different cursor depending on vim mode, does not work on all terminals.
  # Terminals in which I confirmed it works:
  # - Alacritty
  # - Gnome Terminal
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

  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

  PATH=$PATH:~/.local/bin
  # Rust
  if [ $commands[rustc] ]; then
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
    export PATH=$PATH:~/.cargo/bin
  fi

  # nvm_start=`date +%s.%N`
  # NVM ON Linux
  export NVM_DIR="$HOME/.nvm"
  # [ -s "$NVM_DIR/install-nvm-exec" ] && \. "$NVM_DIR/install-nvm-exec" # TODO: Not sure what this loads
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  nvm_end=`date +%s.%N`
  # echo "NVM Time: $((nvm_end-nvm_start))"
  #
  

  if [ $commands[pyenv] ]; then
    # PyEnv
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    pyenv global 3.10.6
  fi

  # gcloud_start=`date +%s.%N`
  ##
  # Kubernetes Specific
  ##
  # The next line enables shell command completion for gcloud.
  if [ -f "$HOME/.local/opt/google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/.local/opt/google-cloud-sdk/completion.zsh.inc"; fi
  # The next line updates PATH for the Google Cloud SDK.
  if [ -f "$HOME/.local/opt/google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/.local/opt/google-cloud-sdk/path.zsh.inc"; fi

  if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)

    # Deprecated function, I should update it at some point
    # function kenv() {
    #   if [ "$1" != "" ]
    #   then
    #     setupAWS
    #     export KOPS_STATE_STORE="s3://k8s-$1-state-store"
    #     if [ "$1" = "production" ]
    #     then
    #       export KOPS_STATE_STORE="s3://k8s-$1-state-store-repositive"
    #     fi
    #     kops export kubecfg "k8s-$1.repositive.io"
    #   else
    #     setupAWS --unset
    #     unset KOPS_STATE_STORE
    #   fi
    # }

  fi

  # gcloud_end=`date +%s.%N`
  # echo "Gcloud Time: $((gcloud_end-gcloud_start))"

  if [[ $TERM = dumb ]]; then
    unset zle_bracketed_paste
  fi

  # 10ms for key sequences
  KEYTIMEOUT=1

  # Aliases
  alias clip='xclip -sel clip'

  alias pubip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"

  # Kills any process with the given name 
  function kill-process() {
    ps -u $(whoami) | rg "$1" | awk '{print $1}' | xargs kill -9 2> /dev/null
  }


  # Kills any process with the provided name using a port
  function kill-net-process() {
    lsof -n 2> /dev/null | rg LISTEN | rg "$1" | awk '{print $2}' | xargs kill -9 2> /dev/null
  }

  # kills any process using the specified port
  function kill-port() {
    lsof -n 2> /dev/null | rg "$1" | rg node | awk '{print $2}' | xargs kill -9 2> /dev/null
  }

  if [ $commands[docker] ]; then
    alias dmem='docker stats $(docker ps --format={{.Names}})'
    alias drun='docker run -it -u $UID --network=host --rm -v $(pwd):/opt/work --workdir=/opt/work'
  fi

  if which ruby >/dev/null && which gem >/dev/null; then
      PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
  fi

  # History opts
  export HISTFILE=~/.histfile
  export SAVEHIST=1000000
  export HISTSIZE=1000000
  setopt inc_append_history
  setopt share_history

  # Other exports
  # These are used in some specific situations but do not harm the system if added in general.
  export UID=$UID # Helps with docker_files, allows to use UID as env
  export GPG_TTY=$(tty) # gpg doesn't work in some environments without this env (WSL)
  export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  export EDITOR='nvim' # Use code as editor

  gpgconf --launch gpg-agent

  # [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  # [ -f ~/emsdk-portable/emsdk_env.sh ] && source ~/emsdk-portable/emsdk_env.sh

  if [[ $OSTYPE == 'darwin'* ]]; then
  elif grep -q Microsoft /proc/version; then
    # Detect if we are running on WSL
    # If so, docker should connect to the host daemon
    export DOCKER_HOST=tcp://localhost:2375
    export COMPOSE_CONVERT_WINDOWS_PATHS=true
    # export COMPOSE_FORCE_WINDOWS_HOST=true

    # Necesary to setup a display to use the X server running in the host machine.
    export DISPLAY=localhost:0.0
  fi

fi

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"
