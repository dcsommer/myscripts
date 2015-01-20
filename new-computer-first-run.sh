#!/bin/bash

BEGIN_DIR=$(pwd)

# Script to run to setup a fresh install of ubuntu with my scripts, programs, etc.

sudo apt-get install git ubuntu-restricted-extras vlc python3 bpython \
    emacs compiz-plugins-main compizconfig-settings-manager \
    clementine pidgin pidgin-otr deluge nautilus-open-terminal \
    gparted

# Thanks: http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
SCRIPT_DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $SCRIPT_DIR
git submodule init
git submodule update

# Get the list of all the dot files.
subdir="dotfiles/"
files=$(ls -a $subdir)
for file in $files
do
    if [[ $file == "." ]] || [[ $file == ".." ]];
    then
        continue;
    fi
    remove=$HOME"/"$file
    link_here=$SCRIPT_DIR"/"$subdir$file
    echo "Removing" $remove
    rm $remove -rf
    echo "Creating symbolic link from" $remove "to" $link_here
    ln -f -s $link_here $remove
done

#.bashrc is handled differently
echo ". $SCRIPT_DIR/other/.bashrc-master" >> ~/.bashrc

# Return to invocation directory
cd $BEGIN_DIR
