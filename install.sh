#!/usr/bin/env bash

# Get the path to the dotfiles for use when creating symlinks
BASEDIR=$(dirname $(realpath $0))

function link() {
    # This function is intended to not overwrite any existing configurations
    # so that they can be recovered if desired.
    date_str=$(date +%Y-%m-%d)
    dest_path=$(dirname "$1")
    dot_name=$(basename "$1")

    # Remove the dot infront of file names if present so that they can be stored
    # in the repository without being hidden.
    if [[ $dot_name =~ ^\. ]]; then
        dot_name=${dot_name:1}
    fi

    echo "==> Target: $1"

    if [ -h $1 ]; then
        # Symlink exists
        echo "  -> Removing existing symlink: $1"
        rm $1

    elif [ -f $1 ]; then
        # File exists
        echo "  -> Backing up existing file: $1 -> $1.$date_str"
        mv $1 $1.$date_str
    fi

    if [ ! -d $dest_path ]; then
        # Path does not exist
        echo "  -> Creating directory: $dest_path"
        mkdir -p $dest_path
    fi

    # Create the symlinks to dotfiles in relative path to script
    echo "  -> Creating new symlink: $1"
    ln -s $BASEDIR/$dot_name $1
}

function display_warning() {
    # There are likely a bunch of required packages for the dotfiles being
    # linked. Installing the packages is beyond the scope of this script
    echo ""
    echo "Before using these dotfiles, ensure that all of the required packages/repositories are installed."
    echo ""

    echo "This script will perform the following actions:"
    echo "    Symlink: Delete if found"
    echo "    File:    Backup if found"
    echo "    Path:    Create if not found"
    echo "    Create Symlinks for the dotfiles to their appropriate paths"
    echo ""

    read -p "Would you like to continue? [y/N] " answer
    if [[ ! "$answer" =~ ^(Y|y)$ ]]; then
        echo "Exiting..."
        echo ""
        exit 0
    fi
}

display_warning

echo ""
#link "$HOME/.config/rofi/config.rasi"
#link "$HOME/.tmux.conf"
#link "$HOME/.vimrc"
#link "$HOME/.zshrc"
#link "$HOME/.xmonad/xmonad.hs"
#link "$HOME/.xmobar/xmobarrc"
#link "$HOME/.Xresources"
#link "$HOME/.xsession"
echo ""
