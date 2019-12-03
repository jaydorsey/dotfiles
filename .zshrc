# Uncomment this, and the last line in this file for profiling information
# zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# This is the term setting I used before
# export TERM="screen-256color"
# This term setting is used to get italics working, along with this gist: https://gist.github.com/sos4nt/3187620
# export TERM="xterm-256color"
export POWERLEVEL9K_MODE='awesome-fontconfig'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
export ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# https://stackoverflow.com/a/41620534/2892779
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git asdf bundler gem zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search colored-man-pages z.lua fzf tmux navi)

# Automatically load additional completion scripts. This is really slow so I've disabled for now
# https://github.com/zsh-users/zsh-completions/blob/master/README.md
# autoload -U compinit && compinit

# Always automatically update oh-my-zsh
DISABLE_UPDATE_PROMPT="true"

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# https://statico.github.io/vim3.html
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# https://github.com/junegunn/fzf#settings
_fzf_compgen_path() { fd --hidden --follow --exclude ".git" . "$1" }

# Use fd to generate the list for directory completion
_fzf_compgen_dir() { fd --type d --hidden --follow --exclude ".git" . "$1" }

source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

export ARCHFLAGS="-arch x86_64"
# macOS Catalina fix: https://stackoverflow.com/a/58323411/2892779
# export CPATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include
# oh Catalina, how do you disappoint me? let me count the ways
# https://github.com/rbenv/ruby-build/issues/1361#issuecomment-543815155
export SDKROOT="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
export CFLAGS="-I/usr/local/opt/openssl/include"
export LDFLAGS="-L/usr/local/opt/openssl/lib -L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

export EDITOR="nvim"
export ERL_AFLAGS="-kernel shell_history enabled"
# Also defines the default command run when :Files is called in vim
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow \
  -g \"!{.git,frontend,frontend/node_modules,node_modules,Library,.gnupg,swagger,storage,.config/yarn,tmp,.yardopts,doc}/*\" \
  -g \"!package-lock.json\" \
  -g \"!*.map\" \
  -g \"!*.log\" \
  -g \"!tags\" \
  -g \"!yarn.lock\" \
  2> /dev/null"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229 --color info:150,prompt:110,spinner:150,pointer:167,marker:174'

# Ignore certain commands from zsh history via regex
export HISTORY_IGNORE="cd|ls|clear|tmux|ttmux|vi|ls|exit|z *"
export HISTORY_IGNORE="$HISTORY_IGNORE|git a|git s|cd ..|git co master|git pull|brew update|brew upgrade|vi|vim|nvim|OA|pwd"

export KERL_CONFIGURE_OPTIONS="--disable-debug \
  --disable-silent-rules \
  --without-javac \
  --enable-shared-zlib \
  --enable-dynamic-ssl-lib \
  --enable-hipe \
  --enable-sctp \
  --enable-smp-support \
  --enable-threads \
  --enable-kernel-poll \
  --enable-wx \
  --enable-darwin-64bit \
  --with-ssl=/usr/local/opt/openssl"

export NAVI_PATH="$HOME/.navi"
export PAGER="less"

# My custom scripts go in ~/bin, put that in the path first
export PATH=~/bin:$PATH
# Most of the homebrew executables end up here
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/Users/jay/.asdf/installs/nodejs/8.12.0/.npm/bin # Run `yarn global bin` to find this path
export PATH=$PATH:/Users/jay/Library/Python/3.7/bin # brew install python path
export PATH=$PATH:/Users/jay/Library/Python/2.7/bin
export PATH=$PATH:/usr/local/opt/coreutils/libexec/gnubin
export PATH=$PATH:/usr/local/opt/postgresql/bin
export PATH=/usr/local/opt/openssl/bin:$PATH
# https://github.com/denisidoro/navi#using-oh-my-zsh
export PATH=$PATH:"$ZSH_CUSTOM/plugins/navi"
# This is necessary for, at least, crystal
# https://github.com/brianmario/mysql2/issues/795#issuecomment-337006164
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
# capybara-webkit, temporary
export PATH=$PATH:/Users/jay/Qt5.5.0/5.5/clang_64/bin/
# For crystal
export PATH="/usr/local/opt/llvm@6/bin:$PATH"
# For Rust
export CARGO_HOME="$HOME/.cargo"
export PATH="$PATH:$CARGO_HOME/bin"

# https://luckyframework.org/guides/getting-started/installing
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

# Always show full history
export PROMPT_COMMAND='history -a'

# Allow vi-mode in zsh
#
# https://dougblack.io/words/zsh-vi-mode.html
bindkey -v
# Reduce the delay after pressing <ESC> key
export KEYTIMEOUT=0.4

# Make home/end work right inside of tmux. These still don't work quite right
# outside of tmux but I'll deal with that issue separately
#
# https://zserge.com/blog/terminal.html
bindkey '\e[3~'   delete-char
bindkey '^A'      beginning-of-line
bindkey '^E'      end-of-line
# bindkey '^R'      history-incremental-pattern-search-backward

# https://github.com/junegunn/fzf/issues/1304#issuecomment-394171410
bindkey "^I" fzf-completion
bindkey "^R" fzf-history-widget
bindkey "^T" fzf-file-widget
bindkey "^[c" fzf-cd-widget

export POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status root_indicator)
export RANGER_LOAD_DEFAULT_RC=FALSE
# Ignore deprecation warnings
export RUBY_OPT="-W0"
# Run `brew --prefix readline` to find this path
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl --with-readline-dir=/usr/local/opt/readline --with-jemalloc=/usr/local/opt/jemalloc"
# RSpec, I prefer my specs to fail fast & document
# export SPEC_OPTS="-f d --fail-fast"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/highlighters

alias cat='bat'
alias gua='find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;'
# Exercism setup
alias guardme="guard -c --guardfile ~/exercism/ruby/Guardfile"
alias gwip="LEFTHOOK=0 g commit -m 'WIP'"
alias ls='~/bin/colorls --report'
# alias ls='lsd'
alias ping='prettyping --nolegend'
alias top='sudo htop'
alias untracked='git ls-files -o --exclude-standard'
alias vi='nvim'
alias vim='nvim'

if [ -f ~/.personalrc ]; then
  source ~/.personalrc
fi

if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

# Extended format with dates
setopt EXTENDED_HISTORY

# Do not share history between terminal tabs/sessions
setopt SHARE_HISTORY

# Remove command line from history list when first character on the line is a space
setopt HIST_IGNORE_SPACE

# Remove extra blanks from each command line being added to history
setopt hist_reduce_blanks

# When trimming history, lose oldest duplicates first
setopt HIST_EXPIRE_DUPS_FIRST

# Not sure how this is different from the others
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS

# Older commands that duplicate newer ones are omitted
setopt HIST_SAVE_NO_DUPS

# Allow multiple terminal sessions to all append to one zsh command history
# setopt APPEND_HISTORY

# Write to the history file immediately
setopt INC_APPEND_HISTORY

# Don't find duplicates in history
setopt HIST_FIND_NO_DUPS

# pip3 install --upgrade --user pip setuptools neovim wheel neovim yamllint pynvim
# pip install --upgrade --user pip setuptools neovim wheel neovim yamllint pynvim

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=~/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# Start navi with CTRL-G from a terminal
# https://github.com/denisidoro/navi#shell-widget
source "$(navi widget zsh)"

# zprof
