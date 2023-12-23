#!/bin/bash

# install brew for linux
sudo yum install git -y
sudo yum install cmake -y
sudo yum install gcc -y
sudo yum install gcc-c++ -y

export NONINTERACTIVE=1
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.bashrc

# install tools
brew install fish
brew install exa
brew install starship
brew install ripgrep
brew install fd
brew install fzf
brew install lazygit
brew install cowsay

brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
brew install nvim
brew install chezmoi

# install fish dependencies
fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish

# setup chezmoi
chezmoi init https://github.com/OkkarMin/dotfiles.git
chezmoi apply
