#!/usr/bin/env bash

echo "Bootstrapping new system config..."


echo ""
echo "---------------"
echo "Configuring ssh"
echo "---------------"
if ! command -v ssh > /dev/null 2>&1
then
    echo >&2 "ssh could not be found... uh... better fix that"
else
    ln -s $HOME/.config/ssh/config $HOME/.ssh/config
fi


#echo ""
#echo "---------------"
#echo "Configuring git"
#echo "---------------"
#if ! command -v git > /dev/null 2>&1
#then
#    echo >&2 "zsh could not be foundi, skipping configuration"
#else
#    ln -s $HOME/.config/zsh/profile $HOME/.zprofile
#    ln -s $HOME/.config/zsh/rc $HOME/.zshrc
#fi


echo ""
echo "---------------"
echo "Configuring zsh"
echo "---------------"
if ! command -v zsh > /dev/null 2>&1
then
    echo >&2 "git could not be found, install with 'brew install git' or more likely xcode command line tools"
else
    ln -s $HOME/.config/git/config $HOME/.gitconfig
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

