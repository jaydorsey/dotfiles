# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
export TERM="xterm-256color"
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
# DISABLE_AUTO_TITLE="true"

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
plugins=(git asdf bundler gem zsh-completions zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)

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
export EDITOR="nvim"
export ERL_AFLAGS="-kernel shell_history enabled"
# Also defines the default command run when :Files is called in vim
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,frontend,frontend/node_modules,node_modules,Library,.gnupg,.config/yarn,tmp}/*" -g "!*.log" -g "!tags" -g "!docs/api/index.html" -g "!docs/api/apiary.apib" 2> /dev/null'
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229 --color info:150,prompt:110,spinner:150,pointer:167,marker:174'
export KERL_CONFIGURE_OPTIONS="--disable-debug --disable-silent-rules --without-javac --enable-shared-zlib --enable-dynamic-ssl-lib --enable-hipe --enable-sctp --enable-smp-support --enable-threads --enable-kernel-poll --enable-wx --enable-darwin-64bit --with-ssl=/usr/local/opt/openssl"
export LOG_LEVEL="error"
export PAGER="less"
# My custom scripts go in ~/bin, put that in the path first
export PATH=~/bin:$PATH
# Most of the homebrew executables end up here
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/Users/jay/.asdf/installs/nodejs/8.12.0/.npm/bin # Run `yarn global bin` to find this path
export PATH=$PATH:/Users/jaydorsey/Library/Python/3.7/bin # brew install python path
export PATH=$PATH:/usr/local/opt/coreutils/libexec/gnubin
export PATH=$PATH:/usr/local/opt/postgresql/bin
export POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
export RANGER_LOAD_DEFAULT_RC=FALSE
# Run `brew --prefix readline` to find this path
# This is unnecessary right now, ruby-build picks up readline & ssl from homebrew
# export RUBY_CONFIGURE_OPTS="--with-readline-dir=/usr/local/opt/readline"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/highlighters

alias gua='find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;'
# Exercism setup
alias guardme="guard -c --guardfile ~/exercism/ruby/Guardfile"
alias ping='prettyping --nolegend'
alias top='sudo htop'
alias vi='nvim'
alias vim='nvim'

if [ -f ~/.personalrc ]; then
  source ~/.personalrc
fi

if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

# Do not share history between terminal tabs/sessions
unsetopt share_history