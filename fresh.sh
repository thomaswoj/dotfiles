#!/bin/sh

echo "Setting up your Mac..."

# Hide "last login" line when starting a new terminal session
touch $HOME/.hushlogin

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew tap axllent/apps
brew bundle

# imagemagick warning
echo "For imagemagick support please: brew install pkg-config imagemagick && pecl install imagick, for each php version"

# Show hidden files in finder by default
defaults write http://com.apple.Finder AppleShowAllFiles true

# Set default MySQL root password and auth type
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install global Composer packages
/opt/homebrew/bin/composer global require laravel/installer laravel/valet beyondcode/expose

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Create default directories
mkdir $HOME/code
mkdir $HOME/valet

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Add global gitignore
ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global
git config --global core.excludesfile $HOME/.gitignore_global

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
# source .macos
