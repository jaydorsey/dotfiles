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


#######################################################
#
# This gets exported as above later, at some point, by homebrew (I think) so
# follow the same pattern
#
#######################################################
HOMEBREW_PREFIX=$(brew --prefix)

# Stops the "last logged in at" message when you open a new terminal window
touch ~/.hushlogin

brew tap homebrew/cask
brew bundle --verbose
brew link --force readline

git clone https://github.com/zsh-users/antigen.git ~/.antigen

git clone https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all

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
pip3 install --user --upgrade pip setuptools neovim wheel neovim yamllint sqlparse pynvim iredis psutil


#######################################################
#
# asdf for programming language version management
#
#######################################################
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.6

~/.asdf/bin/asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
~/.asdf/bin/asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
~/.asdf/bin/asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
~/.asdf/bin/asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
~/.asdf/bin/asdf plugin-add golang https://github.com/asdf-vm/asdf-golang.git
~/.asdf/bin/asdf plugin-add crystal https://github.com/asdf-vm/asdf-crystal.git
~/.asdf/bin/asdf plugin-add python https://github.com/asdf-vm/asdf-python.git

bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring


#######################################################
#
# oh-my-zsh for zsh configuration management
#
#######################################################
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker > ~/.zsh/completion/_docker
curl -L https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker_compose

# Install navi
mkdir -p ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/navi
git clone https://github.com/denisidoro/navi ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/navi


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
tic -o ~/.terminfo xterm-256color.terminfo


echo "Use stow . to symlink all files/directories"

# This is where I put local exports, settings, etc.
echo "Symlink or create your ~/.localrc file"

# https://github.com/VSCodeVim/Vim#mac
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write -g ApplePressAndHoldEnabled -bool false

# Turn on full keyboard access (tab thru system menu items)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

cargo install cw

# Run this once
# https://build.betterup.com/one-weird-trick-that-will-speed-up-your-bundle-install/
echo 'export MAKE="make -j$(nproc)"' >> $home/.localrc

# Generate tags for bundled gems. The grep ignores lines started with "The", which includes certain
# tzinfo warnings that's common
# ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths | grep -v "^The" | sed 's/$/\/lib/'
#
# Typically, you want to run this command once, in the repo root:
#
#     ctags . $(bundle list --paths)
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
