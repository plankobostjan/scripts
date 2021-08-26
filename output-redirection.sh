#!/bin/bash

if [ $1 -eq 1 ]
then
    # Made with the help of: https://ops.tips/gists/redirect-all-outputs-of-a-bash-script-to-a-file

    LOG_FILE="./output.log"
    
    # Open standard out at `$LOG_FILE` for write.
    # This has the effect 
    exec 1>>$LOG_FILE
    
    # Redirect standard error to standard out such that 
    # standard error ends up going to wherever standard
    # out goes (the file).
    exec 2>&1
fi

echo "I'm alive!"
ls -l
whoami
echo "Goodbye! Thank you for playing."
