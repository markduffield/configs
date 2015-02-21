# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# Set custom paths
export NODE=/usr/local/share/npm/bin
export RVM=$HOME/.rvm/bin
export COMPOSER_VENDOR=$HOME/.composer/vendor/bin

PATH=:/usr/local/sbin:/usr/local/bin:/usr/local/share:$HOME/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr

# Better tab completion
autoload -U compinit
compinit

# Case insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
