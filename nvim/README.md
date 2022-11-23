# Neovim Configuration

### Installing Nvim on Unix Systems
```bash
# Install Neovim
brew install neovim
## or
apt, yum, etc... install neovim

# Clone Config
git clone git@github.com:cctechwiz/neovim-config.git ~/.config/nvim

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install Neovim Pluginss
nvim +PlugInstall +qall
```

### Installing Nvim on Windows
```bash
# Install Neovim
choco install neovim

# Clone Config
git clone git@github.com:cctechwiz/neovim-config.git ~/AppData/Local/nvim

# Install vim-plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$env:LOCALAPPDATA/nvim-data/site/autoload/plug.vim" -Force

# Install Neovim Plugins
nvim +PlugInstall +qall
```
