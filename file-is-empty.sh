#!/bin/bash

# Created with the help of: https://unix.stackexchange.com/questions/386499/how-to-check-if-file-is-empty-or-it-has-only-blank-characters

if ! grep -q '[^[:space:]]' $1
then
    echo "Empty"
else
    echo "Not empty"
fi
