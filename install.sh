#!/bin/bash

for file in $HOME/dotfiles/*; do
    if [ -e $HOME/.$(basename $file)]; then
        rm $HOME/.$(basename $file)
    fi
    ln -s $file $HOME/.$(basename $file)
done
