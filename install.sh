#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DOTFILES=("aliases" "gitconfig" "gitignore_global" "bashrc" "bash_profile" "bash_aliases" "bash_prompt" "vimrc")


# Symlinks
# ==============================================================================
echo "This script will create the following files:"
for i in "${DOTFILES[@]}"
do
   echo "- ~/.$i"
done

read -p "We will remove these files if they already exist. Continue? (y/n)" CONT
if [ "$CONT" == "y" ]; then

   for i in "${DOTFILES[@]}"
   do
      echo "Installing .$i ..."
      rm -f ~/.$i
      ln -nfs ${BASEDIR}/dotfiles/$i ~/.$i
   done

   # Reload shell
   exec $SHELL -l
fi