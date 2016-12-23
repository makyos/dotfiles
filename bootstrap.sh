#!/bin/bash

DOTS=(.bashrc .gitconfig .gitignore .emacs.d)
for file in ${DOTS[@]}; do
    ln -s $HOME/src/dotfiles/$file $HOME/$file \
    && echo $HOME/$file
done

