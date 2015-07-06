#!/bin/bash

main() {

    echo ""
    echo ""
    echo "###############################################################"
    echo -e "Select an option:"
    echo -e "1. Install Homebrew"
    echo -e "2. Install Oh My Zsh"
    echo -e "3. Install core apps"
    echo -e "4. Configure vim"
    echo -e "5. Set up iTerm2"
    echo -e "6. Set up OSX defaults"
    echo -e "7. All"
    echo -e "8. Quit"
    echo "###############################################################"
    echo ""
    read option

    case "$option" in
        1)  installHomebrew
            ;;
        2)  installOhMyZsh
            ;;
        3)  installCoreApps
            ;;
        4) configureVim
            ;;
        8)  echo "Exiting..."
            exit 0;
            ;;
        *)  echo "Invalid option. Exiting..."
            exit 0;
            ;;
    esac
}

# Before we can install any apps, need to have Homebrew ready
installHomebrew() {
    echo "Intalling Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "Done"
    main
}

# Set up a cool command line
installOhMyZsh() {
    echo "Installing Oh-My-Zsh..."
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
    echo "Done"
    main
}

# Done via Homebrew and Cask
installCoreApps() {

    echo "Installing core apps via Homebrew and Cask..."

    # Make sure we’re using the latest Homebrew
    brew update
     
    # Upgrade any already-installed formulae
    brew upgrade

    brew install ack
    brew install ctags
    brew install the_silver_searcher
    brew install macvim
    brew install zsh

    install caskroom/cask/brew-cask
    brew cask install iterm2
    brew cask install sequel-pro
    brew cask install intellij-idea
    brew cask install sourcetree
    brew cask install dropbox

    # Remove outdated versions from the cellar
    brew cleanup

    echo "Done"
    main
}

# For the most part, Vim will be set up by bringing down
# my vimrc from Git and running PluginInstall, but 
# Vundle needs to be set up first
configureVim() {
    echo "Configuring Vim..."

    # Make the directory for Vundle only if it doesn't already exist
    if [ ! -d ~/dotfiles/vim/bundle ]; then
        echo "Looks like ~/dotfiles/vim/bundle doesn't already exist...creating it now"
        mkdir -p ~/dotfiles/vim/bundle
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    else 
        echo "~/dotfiles/vim/bundle already exits...updating Vundle"
        cd ~/dotfiles/vim/bundle
        git pull https://github.com/gmarik/Vundle.vim.git
    fi
}

main
