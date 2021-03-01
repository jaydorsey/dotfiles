# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Uncomment this, and the last line in this file for profiling information
# zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOMEBREW_PREFIX/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# This appears to be set in at least the M1 version of brew
if [[ -z "${HOMEBREW_PREFIX}" ]]; then
  export HOMEBREW_PREFIX=$(brew --prefix)
fi

# This is the term setting I used before
# export TERM="screen-256color"
# This term setting is used to get italics working, along with this gist: https://gist.github.com/sos4nt/3187620
export TERM="xterm-256color-italic"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
export ZSH_THEME="powerlevel10k/powerlevel10k"

# https://github.com/ansible/ansible/issues/32499#issuecomment-341578864
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY="YES"

# Location of my dotfiles repo, for symlinking. Override this in .localrc if
# needed
export DOTFILES_PATH="$HOME/projects/jaydorsey/dotfiles"

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
plugins=(git asdf gem zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search colored-man-pages z.lua fzf tmux)

# Automatically load additional completion scripts. This is really slow so I've disabled for now
# https://github.com/zsh-users/zsh-completions/blob/master/README.md
# autoload -U compinit && compinit

# Always automatically update oh-my-zsh
DISABLE_UPDATE_PROMPT="true"

# Disable magic functions (can cause slow pasting)
# https://github.com/ohmyzsh/ohmyzsh/issues/5569#issuecomment-491504337
DISABLE_MAGIC_FUNCTIONS=true

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# https://statico.github.io/vim3.html
if [ -e $HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh ]; then
  source $HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh
  source $HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh
fi

# https://github.com/junegunn/fzf#settings
_fzf_compgen_path() { fd --hidden --follow --exclude ".git" . "$1" }

# Use fd to generate the list for directory completion
_fzf_compgen_dir() { fd --type d --hidden --follow --exclude ".git" . "$1" }

# Used with active-record-query-trace gem &
# ActiveRecord::Type::Boolean.new.cast(ENV.fetch("AR_TRACE", false)) to conditionally enable
# query tracing in console
export AR_TRACE=false

# Used with the devtrace gem provided by Scout
export SCOUT_DEV_TRACE=false

export ARCHFLAGS="-arch arm64"
# export SDKROOT="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
# export CFLAGS="-I$HOMEBREW_PREFIX/opt/openssl@1.1/include -O2 -g -fno-stack-check"
export CFLAGS="-I$HOMEBREW_PREFIX/opt/openssl@1.1/include -I$HOMEBREW_PREFIX/opt/readline/include -I$HOMEBREW_PREFIX/opt/jemalloc/include -I$HOMEBREW_PREFIX/opt/gmp/include"
export LDFLAGS="-L$HOMEBREW_PREFIX/opt/openssl@1.1/lib -L$HOMEBREW_PREFIX/opt/readline/lib -L$HOMEBREW_PREFIX/opt/jemalloc/lib -L$HOMEBREW_PREFIX/opt/gmp/lib"
export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/openssl@1.1/include -I$HOMEBREW_PREFIX/opt/readline/include -I$HOMEBREW_PREFIX/opt/jemalloc/include -I$HOMEBREW_PREFIX/opt/gmp/include"
export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/openssl@1.1/lib/pkgconfig:$HOMEBREW_PREFIX/opt/readline/lib/pkgconfig:$HOMEBREW_PREFIX/opt/jemalloc/lib/pkgconfig:$HOMEBREW_PREFIX/opt/gmp/lib/pkgconfig"

export EDITOR="nvim"
export ERL_AFLAGS="-kernel shell_history enabled"

# Also defines the default command run when :Files is called in vim
export FZF_DEFAULT_COMMAND="rg --files --hidden \
  -g \"!{.git,frontend,frontend/node_modules,node_modules,Library,.gnupg,swagger,storage,.config/yarn,tmp,.yardopts,doc}/*\" \
  -g \"!package-lock.json\" \
  -g \"!*.map\" \
  -g \"!*.log\" \
  -g \"!.elixir_ls\" \
  -g \"!**/tmp/**/*\" \
  -g \"!**/node_modules/*\" \
  -g \"!**/bower_modules/*\" \
  -g \"!**/dist/*\" \
  -g \"!tags\" \
  -g \"!*.dwarf\" \
  -g \"!yarn.lock\" \
  -g \"!*.jay\" \
  -g \"!deps/**/*\" \
  -g \"!_build/**/*\" \
  -g \"!*.tmp\" \
  -g \"!db/backups\" \
  2> /dev/null"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229 --color info:150,prompt:110,spinner:150,pointer:167,marker:174'

# Ignore certain commands from zsh history via regex
export HISTORY_IGNORE="cd|ls|clear|tmux|ttmux|vi|exit|z *"
export HISTORY_IGNORE="$HISTORY_IGNORE|git a|git s|cd ..|git co master|git pull|brew update|brew upgrade|vi|vim|nvim|OA|pwd"
export HISTORY_IGNORE="$HISTORY_IGNORE|code|gcm|g a|g s|g commit|g diff|be rails s|be rails c|irb|pry|g a|g s"

export KERL_BUILD_DOCS=yes
export KERL_CONFIGURE_OPTIONS="--disable-debug \
  --disable-silent-rules \
  --enable-shared-zlib \
  --enable-dynamic-ssl-lib \
  --enable-hipe \
  --enable-sctp \
  --enable-smp-support \
  --enable-threads \
  --enable-kernel-poll \
  --enable-wx \
  --enable-darwin-64bit \
  --with-ssl=$HOMEBREW_PREFIX/opt/openssl@1.1 \
  --with-dynamic-trace=dtrace"

# https://github.com/denisidoro/navi#using-oh-my-zsh
export PATH=$PATH:"$ZSH_CUSTOM/plugins/navi"
export NAVI_PATH="$HOME/.navi:$HOME/.navi_cheatsheets:$HOME/.oh-my-zsh/custom/plugins/navi/cheats"
export PAGER="less"

export PATH=$PATH:$HOMEBREW_PREFIX/opt/postgresql/bin
# This is necessary for, at least, crystal
# https://github.com/brianmario/mysql2/issues/795#issuecomment-337006164
export LIBRARY_PATH=$LIBRARY_PATH:$HOMEBREW_PREFIX/opt/openssl@1.1/lib/

# For Rust
export CARGO_HOME="$HOME/.cargo"
export PATH="$PATH:$CARGO_HOME/bin"

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

# https://github.com/sharpstone/rack-timeout/blob/master/doc/settings.md#term-on-timeout
export RACK_TIMEOUT_TERM_ON_TIMEOUT=1

export RANGER_LOAD_DEFAULT_RC=FALSE
export REDIS_URL="redis://localhost:6379"
# Ignore deprecation warnings
export RUBYOPT="-W0"
# Run `brew --prefix readline` to find this path
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$HOMEBREW_PREFIX/opt/openssl@1.1 --with-readline --with-jemalloc --with-gmp-dir=$HOMEBREW_PREFIX/opt/gmp"
export RUBY_CONFIGURE_OPTS="--with-openssl --with-readline --with-jemalloc --with-gmp-dir=$HOMEBREW_PREFIX/opt/gmp"
# RSpec, I prefer my specs to fail fast & document
# export SPEC_OPTS="-f d --fail-fast"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/highlighters

# testprof
export TEST_STACK_PROF=1
export TEST_RUBY_PROF=1
export FDOC=1
export FPROF=1
export RD_PROF=1

alias be='bundle exec'
alias sp='spring rails'
alias sr='spring rspec'
alias cat='bat'
alias gua='find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;'
# Exercism setup
alias guardme="guard -c --guardfile ~/exercism/ruby/Guardfile"
alias gwip="LEFTHOOK=0 g commit -m 'WIP'"
alias ls='lsd'
alias ping='prettyping --nolegend'
alias top='sudo htop'
alias vi='nvim'
alias vim='nvim'
alias wc='cw'

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
source <(navi widget zsh)

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# zprof

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Shared personal scripts; these are typically commited tot he repo
export PATH=~/bin:$PATH

# Computer specific scripts; unique to each computer I use
export PATH=~/localbin:$PATH

# Most of the homebrew executables end up here
export PATH=$HOMEBREW_PREFIX/bin:$PATH

# Use newer brew tools (curl, grep)
export PATH="$HOMEBREW_PREFIX/opt/grep/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/curl/bin:$PATH"

# For crystal
# https://embeddedartistry.com/blog/2017/02/24/installing-llvm-clang-on-osx/
export PATH="$HOMEBREW_PREFIX/opt/llvm/bin:$PATH"

export PATH="$HOMEBREW_PREFIX/opt/openssl@1.1/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/readline/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/opt/jemalloc/bin:$PATH"

# Python executable support for asdf
# export PATH="$PATH:$HOME/.local/bin"

# asdf puts python scripts here
export PATH="$HOME/.local/bin:$PATH"

source $HOME/.asdf/asdf.sh
# source $HOME/.asdf/completions/asdf.bash
#

# broot --print-shell-function zsh

# This script was automatically generated by the broot program
# More information can be found in https://github.com/Canop/broot
# This function starts broot and executes the command
# it produces, if any.
# It's needed because some shell commands, like `cd`,
# have no useful effect if executed in a subshell.
function br {
    f=$(mktemp)
    (
	set +e
	broot --outcmd "$f" "$@"
	code=$?
	if [ "$code" != 0 ]; then
	    rm -f "$f"
	    exit "$code"
	fi
    )
    code=$?
    if [ "$code" != 0 ]; then
	return "$code"
    fi
    d=$(<"$f")
    rm -f "$f"
    eval "$d"
}

bindkey '^q' push-line
