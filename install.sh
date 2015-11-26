#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

COMMONPACKAGES=(
    "curl"
    "unzip"
    "build-essential"
)

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

# Common packages
# ==============================================================================
echo "Common packages:"
for i in "${COMMONPACKAGES[@]}"
do
   echo "- $i"
done
read -p "Would you like to install these packages? [y/N]: " CONT
if [ "$CONT" == "y" ]; then
    if [ -n "$(which apt-get)" ]; then
        sudo apt-get update

        for i in "${COMMONPACKAGES[@]}"
        do
          echo "Installing .$i ..."
          sudo apt-get install $i
        done
    fi
fi
echo ""

# Symlinks
# ==============================================================================
echo "This script will create the following files:"
for i in "${DOTFILES[@]}"
do
   echo "- ~/.$i"
done

read -p "Create these files? They will be overwritten if they exist [y/N]: " CONT
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


# Google App Engine
# ==============================================================================
read -p "Install Google App Engine (PHP)? [y/N]: " CONT
if [ "$CONT" == "y" ]; then
    echo "Downloading and extracting App Engine"
    wget https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.25.zip -O /tmp/google_appengine.zip
    sudo unzip /tmp/google_appengine.zip -d /opt

    echo "Installing PHP CGI"
    if [ -n "$(which apt-get)" ]; then
        sudo apt-get install php5-cgi
    fi
fi

# Reload shell
exec $SHELL -l