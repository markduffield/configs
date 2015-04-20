#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlinks
# ==============================================================================

# Directories
ln -nfs ${BASEDIR}/dotfiles/vim ~/.vim

# Files
ln -nfs ${BASEDIR}/dotfiles/aliases ~/.aliases
ln -nfs ${BASEDIR}/dotfiles/gitconfig ~/.gitconfig
ln -nfs ${BASEDIR}/dotfiles/gitignore_global ~/.gitignore_global
ln -nfs ${BASEDIR}/dotfiles/vimrc ~/.vimrc
ln -nfs ${BASEDIR}/dotfiles/zshrc ~/.zshrc
