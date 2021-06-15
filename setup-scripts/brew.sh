#Install Hombrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew doctor

# Install useful binaries
brew install curl
brew install node
brew install the_silver_searcher
brew install wget
brew install zsh
brew install z
brew install terraform
brew install go
brew install powerlevel10k
brew install pre-commit

# Core / Personal
brew install --cask alfred
brew install --cask google-chrome
brew install --cask istat-menus
brew install --cask slack
brew install --cask the-unarchiver
brew install --cask vlc

# dev
brew install --cask iterm2
brew install --cask macvim
brew install --cask visual-studio-code
brew install homebrew/cask/docker
