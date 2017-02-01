#!/bin/bash

DOTS=(.bashrc .gitconfig .gitignore .git-prompt.sh .emacs.d .tmux.conf .git-completion.bash .tmux)
for file in ${DOTS[@]}; do
    [ -e $HOME/$file ] && rm -rf $HOME/$file
    ln -s $HOME/src/dotfiles/$file $HOME/$file \
    && ls -l $HOME/$file
done

