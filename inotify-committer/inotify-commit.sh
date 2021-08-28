#! /bin/bash

WD="$(pwd)"

get_watchlist(){
    WATCHLIST=""
    if [ -e $WD/.gitignore ]; then
        FILE="$WD/.gitignore"
        while read -r LINE; do
            #if [[ "$LINE" =~ ^!.*$  ]] && [[ -e $WD/${LINE:1} ]]; then
            if [[ "$LINE" =~ ^!.*$  ]]; then
                WATCHLIST="$WATCHLIST ${LINE:1}"
            fi
        done < "$FILE"
    else
        WATCHLIST="$WD"
    fi
    echo "$WATCHLIST"
}

main(){
    while true
    do
        MODIFIED_FILE=$(inotifywait -q -e modify,create,delete --format='%f' $WD)
        get_watchlist
        echo "$MODIFIED_FILE"
        if [[ "$WATCHLIST" =~ $MODIFIED_FILE ]]; then
            echo "File $MODIFIED_FILE was modified."
            cd $WD
            git add $MODIFIED_FILE
            git commit -m "$(curl -s whatthecommit.com/index.txt)"
            git push origin main
        fi
    done
}

get_watchlist
main
