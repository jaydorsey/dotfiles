#!/usr/bin/env sh
#
# vim: textwidth=0:filetype=sh
#

# This is a rough outline of the steps that are necessary to setup a new system
# with all my tools/settings on macos

#######################################################
#
# Install Xcode from App Store or download link
#
#######################################################


#######################################################
#
# Install homebrew if not found
#
#######################################################
if [ ! $(which brew) ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install packer, a lua-based package manager
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

#######################################################
#
# This gets exported as above later, at some point, by homebrew (I think) so
# follow the same pattern
#
#######################################################
HOMEBREW_PREFIX=$(brew --prefix)

brew tap homebrew/cask
brew bundle --verbose
brew link --force readline

# git clone https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all

#######################################################
#
# zsh as an allowed, and my default, shell
#
#######################################################
ZSH_FOUND=$(grep -c $HOMEBREW_PREFIX/bin/zsh /etc/shells)

if [ $ZSH_FOUND == 0 ]
then
  echo "missing $HOMEBREW_PREFIX/bin/zsh, adding..."
  sudo sh -c "echo $HOMEBREW_PREFIX/bin/zsh >> /etc/shells"
else
  echo "found $HOMEBREW_PREFIX/bin/zsh, skipping..."
fi


echo $SHELL | grep -v zsh | while read
do
  chsh -s $HOMEBREW_PREFIX/bin/zsh
done

# Use oh-my-zsh as my zsh framework

# Install antigen as a zsh plugin manager
git clone https://github.com/zsh-users/antigen.git ~/.antigen

#######################################################
#
# xcode & cli tools
#
#######################################################
xcode-select --install
sudo xcodebuild -license
# May also need to run below, from: https://nokogiri.org/tutorials/installing_nokogiri.html#unable-to-find-libraries-on-macos-mojave
# open /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg


#######################################################
#
# neovim/python stuff for deoplete, gundo, etc.
#
#######################################################
pip3 install --user --upgrade pip setuptools neovim wheel yamllint sqlparse pynvim iredis psutil graphtage


#######################################################
#
# asdf for programming language version management
#
#######################################################
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1

~/.asdf/bin/asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
~/.asdf/bin/asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

# Required to install nodejs
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

#######################################################
#
# Neovim folders
#
#######################################################
mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/backups
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/views
mkdir -p ~/.terminfo
mkdir -p ~/.config/yamllint
tic -o ~/.terminfo xterm-256color-italic.terminfo


echo "Use stow . to symlink all files/directories"

# This is where I put local exports, settings, etc.
echo "Symlink or create your ~/.localrc file"

# https://github.com/VSCodeVim/Vim#mac
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write -g ApplePressAndHoldEnabled -bool false

# Always make file finder open in expanded state
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Disable save new documents to cloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Don't write .DS_Store files on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Don't auto-substitute smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Don't auto-substitute smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Remove dock auto-hide delay
defaults write com.apple.Dock autohide-delay -float 0 && killall Dock

# Disable dock recent history
defaults write com.apple.dock show-recents -bool no
# Remove recent apps from dock
defaults write com.apple.dock recent-apps -array

# Always show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool YES && killall Finder

# Turn on full keyboard access (tab thru system menu items)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Fastest key repeat rate, can't set via the clickable interface. Log out to activate
# defaults write -g KeyRepeat -int 1

# Fastesst initial repeat; can't set via interface. Log out to activate
# defaults write -g InitialKeyRepeat -int 10

cargo install cw
cargo install atuin
cargo install zoxide --locked
cargo install rtx-cli

npm install -g neovim yarn

# Run this once
# https://build.betterup.com/one-weird-trick-that-will-speed-up-your-bundle-install/
# echo 'export MAKE="make -j$(nproc)"' >> $home/.localrc

# Generate tags for bundled gems. The grep ignores lines started with "The", which includes certain
# tzinfo warnings that's common
# /usr/local/bin/ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths | grep -v "^The" | sed 's/$/\/lib/')
#
# Typically, you want to run this command once, in the repo root:
#
#     /usr/local/bin/ctags . $(bundle list --paths)
#
# For unused tool, you'll want to run this from the root:
#
#     unused --ignore /Users/jay/.asdf/installs/* > out.txt
#
# Then, you'll run git init to setup your git hooks & symlink the .ctags.d folder to your $HOME. Inside
# the git hooks is a command that will append the local code tags onto the tags file for you
#
# Ctags debugging
# ctags --verbose 2> out.txt
#
# Install the pg-extras plugin
# heroku plugins:install git://github.com/heroku/heroku-pg-extras.git
