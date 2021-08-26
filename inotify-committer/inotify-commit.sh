#! /bin/bash

DATA="$HOME/self $HOME/.ssh/known_hosts $HOME/.ssh/config $HOME/.functions $HOME/.aliases $HOME/.zshrc"

while true
do
    MODIFIED_FILE=$(inotifywait -q -e close_write,modify,create,delete $DATA | awk '{ print $1; }')
    cd $HOME
    git add $MODIFIED_FILE
    git commit -m "$(curl -s whatthecommit.com/index.txt)"
    git push origin master
done
