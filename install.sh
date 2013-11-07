#!/bin/sh

folder="$HOME/dotfiles"

if [ ! -d "$folder" ]; then
    echo "Installing dotfiles in $folder"
    git clone https://github.com/feitian124/dotfiles.git "$folder"
else
    echo "dotfiles is already installed, try delete $folder then re-run"
fi

echo ""
echo "------------- bash dotfile -------------------"
mv -v "$HOME/.bashrc"       "/tmp/bashrc"
ln -sv "$folder/bashrc"      "$HOME/.bashrc"

echo ""
echo "------------- vim dotfile -------------------"
mv -v "$HOME/.vimrc"              "/tmp/vimrc"
mv -v "$HOME/.vim/bundle/vundle"  "/tmp/vundle"
ln -sv "$folder/vimrc"      "$HOME/.vimrc"
git clone https://github.com/gmarik/vundle.git "$HOME/.vim/bundle/vundle"
vim +BundleInstall +qall

echo ""
echo "------------- tmux dotfile -------------------"
mv -v "$HOME/.tmux.conf"    "/tmp/tmux.conf"
ln -sv "$folder/tmux.conf"   "$HOME/.tmux.conf"