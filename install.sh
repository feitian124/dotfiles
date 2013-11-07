#!/bin/sh

folder="$HOME/dotfiles"

if [ ! -d "$folder" ]; then
    echo "Installing dotfiles in $folder"
    #git clone https://github.com/feitian124/dotfiles.git "$folder"
else
    echo "dotfiles is already installed"
fi

echo "\n------------- backup dotfiles -------------------"
mv -v "$HOME/.bashrc"       "/tmp/bashrc"
mv -v "$HOME/.vimrc"        "/tmp/vimrc"
mv -v "$HOME/.tmux.conf"    "/tmp/tmux.conf"

echo "\n------------- link   dotfiles -------------------"
ln -sv "$folder/bashrc"      "$HOME/.bashrc"
ln -sv "$folder/vimrc"       "$HOME/.vimrc"
ln -sv "$folder/tmux.conf"   "$HOME/.tmux.conf"
