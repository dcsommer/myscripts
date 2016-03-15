#!/bin/bash

# Script to run to setup a fresh install of ubuntu with my scripts, programs, etc.

sudo apt-get -my install git ubuntu-restricted-extras vlc python3 bpython \
    emacs compiz-plugins-main compizconfig-settings-manager \
    clementine pidgin pidgin-otr deluge gparted curl screen synapse \
    keepass2 terminator

# Thanks: http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
SCRIPT_DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd $SCRIPT_DIR

git submodule init
git submodule update

# Symlink all dotfiles. Recreates a concrete directory structure but all
# files are symlinked back to the git repo.
cp -rs $SCRIPT_DIR/dotfiles/. $HOME/

#.bashrc is handled differently
echo ". $SCRIPT_DIR/other/.bashrc-master" >> ~/.bashrc

# Return to invocation directory
popd
