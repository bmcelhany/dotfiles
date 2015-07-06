#
Installation

## Clone repo:

```
cd ~
mkdir dotfiles && cd dotfiles
git clone https://github.com/bmcelhany/dotfiles.git .
```

## Install Homebrew

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Install oh_my_zsh:

```
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```

## Install command line (homebrew) and gui (cask) apps:

```
./homebrew.sh
```

## Set up Vim
```
mkdir ~/dotfiles/vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
# Set up iTerm2 colorscheme
Open iTerm2, open preferences, go to Profiles -> Preferences -> Load Presets -> Import
Select ~/dotfiles/Solarized Dark.itermcolors
Select "Solarized Dark" from drop down

## Create symlinks in ~

```
./make.sh
```

## Set up sensible OS X defaults:

```
source ~/dofiles/osx.sh
```

## Optional

Depending on paths, may need to modify TODO_DIR value in ~/dotfiles/todo.cfg
