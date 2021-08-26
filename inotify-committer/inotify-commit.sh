#! /bin/bash

DATA="$HOME/self $HOME/.ssh/known_hosts $HOME/.ssh/config $HOME/.functions $HOME/.aliases $HOME/.zshrc"

while true
do
    cd $HOME
    inotifywait -q -e close_write $DATA
    git add .
    git commit -m "$(curl -s whatthecommit.com/index.txt)"
    git push origin master
done
