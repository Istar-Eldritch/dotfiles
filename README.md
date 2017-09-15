dotfiles
---

**Installing**

Clone:
```bash
  git clone git@github.com:Istar-Eldritch/dotfiles.git
```

Execute the `setup.sh` script:
```bash
  sh setup.sh
```


**Git**

* `.gitconfig`: defines my basic git configuration and some aliases.
* `.gitignore`: defines stuff I usually ignore, like vim related files and `.log` files.


**Shell**

* I use zsh
* [zplug](https://github.com/zplug/zplug) as a plugin manager.
* zplug is installed during when running `setup.sh`, be aware of the `awk` dependency in your operating system. Check zplug docs for more info.
* Configuration on `.zshrc`
  * Custom Functions:
    - `setupAWS [--unset]`: Sets the ENV_VARS for AWS access 
    - `kenv [environment]`: Configure kubernetes environment using the Repositivie naming conventions for domains.
    - `dme [environment]`: Configure docker-machine 

**Terminal Multiplexer**

* I use tmux
* [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
* TMP is installed during the `setup.sh` process.
* Configuration on `.tmux.conf`
  * Keybinds:
    - Resize panels
    - Clipboard (VI mode)

**Terminal Emulator**

* I'm using `gnome-terminal`
* `gnome-terminal-cursor-shape.sh` it's a script integrated with vim to change the cursor shape on different vim modes

**Specific Configs for Lenovo X220**

* `.xbindkeysrc`
  - Audio Control (Require ponymix)
  - Backlight
  - WLAN & Bluetooth switches.
