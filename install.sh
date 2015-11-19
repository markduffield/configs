#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DOTFILES=(
    "bashrc"
    "bash_profile"
    "bash_aliases"
    "bash_prompt"
    "gitconfig"
    "gitignore_global"
    "inputrc"
    "myxkbmap"
    "xsessionrc"
    "vimrc"
)

# Symlinks
# ==============================================================================
echo "This script will create the following files:"
for i in "${DOTFILES[@]}"
do
   echo "- ~/.$i"
done

read -p "Create these files? The will be overwritten if they exist [y/N]: " CONT
if [ "$CONT" == "y" ]; then

   for i in "${DOTFILES[@]}"
   do
      echo "Installing .$i ..."
      rm -f ~/.$i
      ln -nfs ${BASEDIR}/dotfiles/$i ~/.$i
   done
fi
echo ""

# PHP
# ==============================================================================
read -p "Install PHP CLI and Composer? [y/N]: " CONT
if [ "$CONT" == "y" ]; then
    echo "Installing PHP CLI (sudo required)"
    if [ -n "$(which apt-get)" ]; then
        sudo apt-get install -y php5-cli
    fi

    echo "Installing Composer"
    curl -sS https://getcomposer.org/installer | php
    chmod +x ./composer.phar
    mkdir -p ~/bin
    mv ./composer.phar ~/bin/composer
fi
echo ""

# NodeJS / NPM
# ==============================================================================
read -p "Install NodeJS/NPM? [y/N]: " CONT
if [ "$CONT" == "y" ]; then
    echo "Adding nodejs 5.x PPA (sudo required)"
    if [ -n "$(which apt-get)" ]; then
        # https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
        curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
        sudo apt-get install -y nodejs
    fi
fi

# Reload shell
exec $SHELL -l