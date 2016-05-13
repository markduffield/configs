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

# Reload shell
exec $SHELL -l