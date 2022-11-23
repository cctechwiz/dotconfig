#!/usr/bin/env bash

echo "Bootstrapping new system config..."


echo ""
echo "---------------"
echo "Configuring git"
echo "---------------"
if ! command -v git > /dev/null 2>&1
then
    echo >&2 "git could not be found, install with 'brew install git' or more likely xcode command line tools"
else
    echo "Configuring git"
    git config --global user.name "Josh Maxwell"
    git config --global user.email cctechwiz@gmail.com
    git config --global init.defaultBranch main
    git config --global --add push.default current
    git config --global --add push.autoSetupRemote true
fi


echo ""
echo "------------------"
echo "Configuring neovim"
echo "------------------"
if ! command -v nvim > /dev/null 2>&1
then
    echo >&2 "nvim could not be found, install with 'brew install neovim'"
else
    echo "Downloading nvim plugin manager plug.vim"
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    echo "Installing nvim plugins"
    nvim +PlugInstall +qall
fi


echo ""
echo "----------------"
echo "Configuring tmux"
echo "----------------"
if ! command -v tmux > /dev/null 2>&1
then
    echo >&2 "tmux could not be found, install with 'brew install tmux'"
else
    echo "Linking tmux configs"
    ln -s $HOME/.config/tmux/tmux.conf $HOME/.tmux.conf
    ln -s $HOME/.config/tmux/tmux.theme $HOME/.tmux.theme
fi

