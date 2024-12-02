#!/usr/bin/env bash

echo "Bootstrapping new system config..."


echo ""
echo "Installing Nerd Fonts"
brew tap homebrew/cask-fonts
brew install font-go-mono-nerd-font


echo ""
echo "---------------"
echo "Configuring zsh"
echo "---------------"
if ! command -v zsh > /dev/null 2>&1
then
  echo >&2 "zsh could not be found, skipping configuration"
else
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  brew install starship
  mv $HOME/.zprofile $HOME/.zprofile.post-oh-my-zsh
  ln -s $HOME/.config/zsh/profile $HOME/.zprofile
  mv $HOME/.zshrc $HOME/.zshrc.post-oh-my-zsh
  ln -s $HOME/.config/zsh/rc $HOME/.zshrc
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

# echo ""
# echo "-------------------"
# echo "Configuring espanso"
# echo "-------------------"
# if ! command -v espanso > /dev/null 2>&1
# then
#   echo >&2 "espanso could not be found, install with 'brew install espanso'"
# else
#   echo "Linking espanso configs"
#   ln -s $HOME/.config/espanso "/Users/jmaxwell/Library/Application Support/espanso/"
# fi


echo ""
echo "------------------"
echo "Configuring neovim"
echo "------------------"
if ! command -v nvim > /dev/null 2>&1
then
  echo >&2 "nvim could not be found, install with 'brew install neovim'"
else
  echo "Installing Neovim Plugins"
  git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  #echo "Downloading nvim plugin manager plug.vim"
  #sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  #  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  #echo "Installing nvim plugins"
  #nvim +PlugInstall +qall
fi


# echo ""
# echo "---------------"
# echo "Configuring ssh"
# echo "---------------"
# if ! command -v ssh > /dev/null 2>&1
# then
#   echo >&2 "ssh could not be found... uh... better fix that"
# else
#   ln -s $HOME/.config/ssh/config $HOME/.ssh/config
# fi


echo ""
echo "---------------"
echo "Configuring git"
echo "---------------"
if ! command -v zsh > /dev/null 2>&1
then
  echo >&2 "git could not be found, install with 'brew install git' or more likely xcode command line tools"
else
  git config --global alias.all '!f() { find . -name .git -type d -prune -exec dirname {} \; | xargs -I{} bash -c "echo '\n## Pulling: {}' && git -C {} $1"; }; f' 
  #ln -s $HOME/.config/git/config $HOME/.gitconfig
fi

