#!/bin/bash

DOTS=(.bashrc .vimrc .emacs.el .tmux.conf .gitconfig .gitignore .git-prompt.sh .git-completion.bash)
for file in ${DOTS[@]}; do
    [ -e $HOME/$file ] && rm -rf $HOME/$file
    ln -s $HOME/src/dotfiles/$file $HOME/$file \
    && ls -l $HOME/$file
done

