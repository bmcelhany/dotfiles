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
        5) setUpIterm
            ;;
        6) setUpOsxDefaults
            ;;
        7) all
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
    echo "";

    # Make sure we’re using the latest Homebrew
    echo "Updating Homebrew..."
    brew update
    echo "Done updating..."
    echo "";
     
    # Upgrade any already-installed formulae
    echo "Upgrading existing apps..."
    brew upgrade
    echo "Done upgrading existing apps..."
    echo "";

    echo "Installing command line tools..."
    echo "";

    read -p "Install ack? " yn
    case $yn in
        [Yy]* ) brew install ack;;
        [Nn]* ) ;;
        * ) echo "Invalid answer. Please select y or n"
    esac

    read -p "Install ctags? " yn
    case $yn in
        [Yy]* ) brew install ctags;;
        [Nn]* ) ;;
        * ) echo "Invalid answer. Please select y or n"
    esac

    read -p "Install Silver Searcher? " yn
    case $yn in
        [Yy]* ) brew install the_silver_searcher;;
        [Nn]* ) ;;
        * ) echo "Invalid answer. Please select y or n"
    esac

    read -p "Install MacVim? " yn
    case $yn in
        [Yy]* ) brew install macvim;;
        [Nn]* ) ;;
        * ) echo "Invalid answer. Please select y or n"
    esac

    read -p "Install Zsh? " yn
    case $yn in
        [Yy]* ) brew install zsh;;
        [Nn]* ) ;;
        * ) echo "Invalid answer. Please select y or n"
    esac

    echo "Installing Cask and GUI apps..."
    brew install caskroom/cask/brew-cask
    echo "";
    
    read -p "Install iTerm2? " yn
    case $yn in
        [Yy]* ) brew cask install iterm2;;
        [Nn]* ) ;;
        * ) echo "Invalid answer. Please select y or n"
    esac

    read -p "Install Sequal Pro? " yn
    case $yn in
        [Yy]* ) brew cask install sequel-pro;;
        [Nn]* ) ;;
        * ) echo "Invalid answer. Please select y or n"
    esac

    read -p "Install IntelliJ Idea? " yn
    case $yn in
        [Yy]* ) brew cask install intellij-idea;;
        [Nn]* ) ;;
        * ) echo "Invalid answer. Please select y or n"
    esac

    read -p "Install SourceTree? " yn
    case $yn in
        [Yy]* ) brew cask install sourcetree;;
        [Nn]* ) ;;
        * ) echo "Invalid answer. Please select y or n"
    esac

    read -p "Install DropBox? " yn
    case $yn in
        [Yy]* ) brew cask install dropbox;;
        [Nn]* ) ;;
        * ) echo "Invalid answer. Please select y or n"
    esac

    # Remove outdated versions from the cellar
    echo "";
    echo "Cleaning up..."
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
        cd ~/dotfiles/vim/bundle/Vundle.vim
        git pull https://github.com/gmarik/Vundle.vim.git
    fi

    echo "Done"
    main
}

setUpITerm() {
    echo "Yeah, not sure if/what I can do here yet. In the meantime, just manually load the Solarized color scheme."    
    main
}

setUpOsxDefaults() {

    # Ask for the administrator password upfront
    sudo -v

    ###############################################################################
    # General UI/UX                                                               #
    ###############################################################################

    echo "Dissable the sound effects on boot"
    sudo nvram SystemAudioVolume=" "

    ###############################################################################
    # Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
    ###############################################################################

    echo "Trackpad: enable tap to click for this user and for the login screen"
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
    defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

    echo "Set a blazingly fast keyboard repeat rate"
    defaults write NSGlobalDomain KeyRepeat -int 0

    ###############################################################################
    # Finder                                                                      #
    ###############################################################################

    echo "Show icons for hard drives, servers, and removable media on the desktop"
    defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
    defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
    defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
    defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

    echo "Disable the warning when changing a file extension"
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

    echo "Use list view in all Finder windows by default"
    # Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
    defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

    echo "Show the ~/Library folder"
    chflags nohidden ~/Library

    echo "Make Dock icons of hidden applications translucent"
    defaults write com.apple.dock showhidden -bool true

    ###############################################################################
    # Safari & WebKit                                                             #
    ###############################################################################

    echo "Show the full URL in the address bar (note: this still hides the scheme)"
    defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true 

    echo "Set Safari’s home page to `about:blank` for faster loading"
    defaults write com.apple.Safari HomePage -string "about:blank"

    echo "New windows open with: Empty Page"
    defaults write com.apple.Safari NewWindowBehavior -int 1

    echo "New tabs open with: Empty Page"
    defaults write com.apple.Safari NewTabBehavior -int 1

    echo "Prevent Safari from opening ‘safe’ files automatically after downloading"
    defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

    echo "Allow hitting the Backspace key to go to the previous page in history"
    defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

    echo "Hide Safari’s bookmarks bar by default"
    defaults write com.apple.Safari ShowFavoritesBar -bool false

    echo "Disable Safari’s thumbnail cache for History and Top Sites"
    defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

    echo "Enable Safari’s debug menu"
    defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

    echo "Make Safari’s search banners default to Contains instead of Starts With"
    defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

    echo "Remove useless icons from Safari’s bookmarks bar"
    defaults write com.apple.Safari ProxiesInBookmarksBar "()"

    echo "Enable the Develop menu and the Web Inspector in Safari"
    defaults write com.apple.Safari IncludeDevelopMenu -bool true
    defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
    defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

    echo "Add a context menu item for showing the Web Inspector in web views"
    defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

    echo "Show status bar"
    defaults write com.apple.Safari ShowStatusBar -bool true

    echo "Done"
    main
}

all() {
    echo "Installing Homebrew..."
    installHomebrew

    echo "Installing Oh-My-Zsh..."
    installOhMyZsh

    echo "Installing core apps..."
    installCoreApps

    echo "Configuring Vim..."
    configureVim

    echo "Setting up iTerm2..."
    setUpIterm
    
    echo "Setting up OS X defaults..."
    setUpOsxDefaults

    echo "Done"
    main
}

main
