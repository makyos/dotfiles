#!/bin/bash

DOTS=(.bashrc .gitconfig .gitignore .git-prompt.sh .emacs.d)
for file in ${DOTS[@]}; do
    if [ -e $HOME/$file ]; then
	tar zcf $HOME/$file.tgz $HOME/$file
	rm -rf $HOME/$file
    fi
    ln -s $HOME/src/dotfiles/$file $HOME/$file \
    && echo $HOME/$file
done

