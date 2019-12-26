#!/usr/bin/env sh

if [ ! -f ~/Library/Fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf ]; then
  wget -O ~/Library/Fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf"
fi

#######################################################
#
# homebrew install & application installation
#
#######################################################
if [ ! $(which brew) ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap caskroom/cask
brew bundle --verbose
brew link --force readline
$(brew --prefix)/opt/fzf/install --all

#######################################################
#
# zsh as an allowed, and my default, shell
#
#######################################################
if [ ! grep -q $(which zsh) /etc/shells ]; then
  sudo sh -c "echo $(which zsh) >> /etc/shells"
fi

echo $SHELL | grep -v zsh | while read
do
  chsh -s /usr/local/bin/zsh
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
pip install --user --upgrade pip setuptools neovim wheel neovim yamllint sqlparse pynvim
pip3 install --user --upgrade pip setuptools neovim wheel neovim yamllint sqlparse pynvim

#######################################################
#
# asdf for programming language version management
#
#######################################################
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.1

~/.asdf/bin/asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
~/.asdf/bin/asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
~/.asdf/bin/asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
~/.asdf/bin/asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
~/.asdf/bin/asdf plugin-add golang https://github.com/asdf-vm/asdf-golang.git
~/.asdf/bin/asdf plugin-add crystal https://github.com/asdf-vm/asdf-crystal.git

bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

#######################################################
#
# oh-my-zsh for zsh configuration management
#
#######################################################
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/bhilburn/powerlevel9k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/skywind3000/z.lua.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/z.lua

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
mkdir -p ~/.config/nvim
mkdir -p ~/.config/yamllint
tic -o ~/.terminfo xterm-256color.terminfo

#######################################################
#
# Symlink all my files
#
#######################################################
ln -sf "$(pwd)/.agignore" ~/.agignore
ln -sf "$(pwd)/.default-gems" ~/.default-gems
ln -sf "$(pwd)/.gemrc" ~/.gemrc
ln -sf "$(pwd)/.gitconfig" ~/.gitconfig
ln -sf "$(pwd)/.gitignore_global" ~/.gitignore_global
ln -sf "$(pwd)/.pryrc" ~/.pryrc
ln -sf "$(pwd)/.tool-versions" ~/.tool-versions
ln -sf "$(pwd)/.vim/after/" ~/.vim/after
ln -sf "$(pwd)/.vim/autoload/" ~/.vim/autoload
ln -sf "$(pwd)/.vimrc" ~/.vimrc
ln -sf "$(pwd)/.zshrc" ~/.zshrc
ln -sf "$(pwd)/TabNine.toml" ~/Library/Preferences/TabNine/
ln -sf "$(pwd)/bin/" ~/bin
ln -sf "$(pwd)/init.vim" ~/.config/nvim/init.vim
ln -sf "$(pwd)/.ctags.d" ~/.ctags.d
ln -sf "$(pwd)/.solargraph.yml" ~/.solargraph.yml
ln -sf "$(pwd)/.navi" ~/.navi
ln -sf "$(pwd)/.tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/.yamllint" ~/.yamllint
ln -sf "$(pwd)/init.vim" ~/.config/nvim/init.vim
ln -sf "$(pwd)/.yamllint" ~/.config/yamllint/config

echo "Symlink or create your .personalrc file"
echo "Symlink or create your .localrc file"

# Generate tags for bundled gems
# ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths | sed 's/$/\/lib/')
# Ctags debugging
# ctags --verbose 2> out.txt

# Install the pg-extras plugin
# heroku plugins:install git://github.com/heroku/heroku-pg-extras.git

