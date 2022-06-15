#!/bin/bash
#title           :mkscript.sh
#description     :Make a header for a bash script, python, c++ or php program.
#author          :userend (https://github.com/ActiveState/code/tree/master/recipes/Bash/577862_Bash_script_create_header_Bash)
#edited_by       :Bostjan Planko
#date            :2018-01-06
#version         :0.6
#usage           :./mkexec
#notes           :Install Vim and Emacs to use this script.
#bash_version    :4.1.5(1)-release
#==============================================================================

today=$(date +%m-%d-%Y)
div=======================================
arg=$1

/usr/bin/clear

select_type(){
case $arg in
py) type=.py
program=/usr/bin/python
version=$(/usr/bin/python --version | awk '{print $2;}')
pname=python
;;
c++|cpp) type=.cpp
program=/usr/bin/cpp
comment=//
version=$(/usr/bin/cpp --version | awk 'NR==1{print $3;}')
pname=c++
;;
php) type=.php
program=/usr/bin/php
comment=//
version=$(/usr/bin/php --version | awk 'NR==1{print $2;}')
pname=php
;;
*) type=.sh
program=/bin/bash
comment=#
version=${BASH_VERSION}
pname=bash
;;
esac
}

select_title(){

# Get the user input.
printf "Enter a title: " ; read -r title

# Remove the spaces from the title if necessary.
title=${title// /_}

# Add .sh to the end of the title if it is not there already.
[ "${title: -3}" != '$type' ] && title=${title}$type

# Check to see if the file exists already.
if [ -e $title ] ; then
#printf "\n%s\n%s\n\n" "The script \"$title\" already exists." \
#      "Please select another title."
read -p "File exists! Append head to title? [Y/n]" yn
append=1
case $yn in
[Nn]* ) printf "Please select another $title."; _select_title; append=0 ;;
[no]* ) printf "Please select another $title."; _select_title; append=0 ;;
[No]* ) printf "Please select another $title."; _select_title; append=0 ;;
[NO]* ) printf "Please select another $title."; _select_title; append=0 ;;
esac
fi
}


get_data(){
printf "Enter a description: " ; read -r dscrpt

name="Bostjan Planko"
read -p "Are you Bostjan Planko? [Y/n]" yn
case $yn in
[Nn]* ) printf "Enter your name: " ; read -r name ;;
[no]* ) printf "Enter your name: " ; read -r name ;;
[No]* ) printf "Enter your name: " ; read -r name ;;
[NO]* ) printf "Enter your name: " ; read -r name ;;
esac
printf "Enter the version number: " ; read -r vnum
}

print_to_file(){
# Format the output and write it to a file.
printf "%-16s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%-16s%-8s\n\
%s\n\n" '#!'$program $comment'title' ":$title" $comment'description' \
":${dscrpt}" $comment'author' ":$name" $comment'date' ":$today" $comment'version' \
":$vnum" $comment'usage' ":./$title" $comment'notes' ':' $comment$pname'_version' \
":${version}" $comment$div${div} > $title
}

/usr/bin/clear

select_editor(){
# Select between Vi, Vim, Emacs, or Nano.
printf "%s\n%s\n%s\n%s\n%s\n\n" "Select an editor." "1 for Vi." "2 for Vim." "3 for Emacs." "4 for Nano"
read -r editor

# Open the file with the cursor on the twelth line.
case $editor in
    1) vi +12 $title
    ;;
    2) vim +12 $title
    ;;
    3) emacs -nw +12 $title
    ;;
    4) nano +12 $title
    ;;
    *) /usr/bin/clear
    printf "%s\n%s\n\n" "I did not understand your selection." \
    "Press <Ctrl-c> to quit."
    select_editor
    ;;
esac
}

select_type
select_title
get_data
if [[ $append == 1 ]]
then
    cat $title > temp
    _print_to_file
    cat temp >> $title
    rm temp
else
    print_to_file
fi
select_editor


# Make the file executable.
chmod 744 $title

/usr/bin/clear
