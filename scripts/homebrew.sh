#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew
brew update
 
# Upgrade any already-installed formulae
brew upgrade

brew install caskroom/cask/brew-cask
brew install ack
brew install ctags
brew install the_silver_searcher
brew install macvim --override-system-vim
brew install zsh
brew install todo-txt

install caskroom/cask/brew-cask
brew cask install iterm2
brew cask install sequel-pro
brew cask install intellij-idea
brew cask install sourcetree
brew cask install dropbox
brew cask install seil

# Remove outdated versions from the cellar
brew cleanup
