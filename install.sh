#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlinks
# ==============================================================================

# Files
echo "Installing .aliases.."
ln -nfs ${BASEDIR}/dotfiles/aliases ~/.aliases

echo "Installing .gitconfig..."
ln -nfs ${BASEDIR}/dotfiles/gitconfig ~/.gitconfig

echo "Installing .gitignore_global..."
ln -nfs ${BASEDIR}/dotfiles/gitignore_global ~/.gitignore_global

echo "Installing .bash_profile..."
ln -nfs ${BASEDIR}/dotfiles/bash_profile ~/.bash_profile

echo "Installing .bash_prompt..."
ln -nfs ${BASEDIR}/dotfiles/bash_prompt ~/.bash_prompt

# Reload shell
exec $SHELL -l
