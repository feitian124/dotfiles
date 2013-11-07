#!/bin/sh

folder="$HOME/dotfiles"

if [ ! -d "$folder" ]; then
    echo "Installing dotfiles in $folder"
    git clone https://github.com/feitian124/dotfiles.git "$folder"
else
    echo "dotfiles is already installed"
fi

mv -v "$HOME/.bashrc"       "/tmp/bashrc"
mv -v "$HOME/.vimrc"        "/tmp/vimrc"
mv -v "$HOME/.tmux.conf"    "/tmp/tmux.conf"

ln -s "$folder/bashrc"      "$HOME/.bashrc"
ln -s "$folder/vimrc"       "$HOME/.vimrc"
ln -s "$folder/tmux.conf"   "$HOME/.tmux.conf"
