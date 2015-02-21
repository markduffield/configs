# DEPENDENCIES
# ==============================================================================

# Antigen
-load-dependencies() {
    # Antigen
    if ! [ -f $HOME/antigen.zsh ]; then
        curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > $HOME/antigen.zsh
    fi

    # Gnome terminal theme
    if [[ $CURRENT_OS == 'Linux' && -f $HOME/base16-ocean.light.sh ]]; then
        curl -L https://raw.githubusercontent.com/chriskempson/base16-gnome-terminal/master/base16-ocean.light.sh > $HOME/base16-ocean.light
    fi
}
-load-dependencies


# THEMEING
# ==============================================================================

# Gnome terminal theme
if [[ $CURRENT_OS == 'Linux' ]]; then
    source $HOME/base16-ocean.dark.sh
fi

# Enable Antigen
source $HOME/antigen.zsh

# Load the oh-my-zsh library
antigen use oh-my-zsh

# Load the theme
antigen theme bureau

# Load plugins
antigen bundle git
antigen bundle tmuxinator
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle ssh-agent

# Node Plugins
antigen bundle node
antigen bundle npm

# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle gem
    antigen bundle osx
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # None so far...

    if [[ $DISTRO == 'CentOS' ]]; then
        antigen bundle centos
    fi
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    antigen bundle cygwin
fi

# Apply all options
antigen apply


# ALIASES
# ==============================================================================

# System
alias upgrade="sudo apt-get update && sudo apt-get upgrade"
alias clipboard="xclip -se c"

alias ls="ls --color"
alias l="ls -lh"
alias ll="ls -la"

# Overrides
alias grep="grep --colour"  # Always highlight
alias ping="ping -c 5"      # Ping with 5 packets

# Directories
alias code="cd ~/Code"


# Zsh Preferences
# ==============================================================================

# PATH variable
export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Change directory without 'cd'
setopt AUTO_CD

# Enable coloured prompt
autoload -U promptinit
# promptinit

# Enable tab completion
# autoload -U compinit
# compinit

# Enable auto-correction of commands typed
setopt correctall

# Case insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
