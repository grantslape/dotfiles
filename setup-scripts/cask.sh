# Install native apps
brew tap phinze/homebrew-cask
brew install brew-cask

function installcask() {
	brew cask install "${@}" 2> /dev/null
}

installcask dropbox
installcask google-chrome
installcask iterm2
installcask macvim
installcask atom
installcask the-unarchiver
installcask vlc
