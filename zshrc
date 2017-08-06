# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
BUNDLED_COMMANDS=(sidekiq)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor root)
# bundler is loader after the rails plugin to that stuff works properly
plugins=(brew capistrano cargo extract gem git history-substring-search knife postgres rails bundler zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Fix for broken zsh prompt
unsetopt auto_name_dirs

# nvm
NVM_DIR=$HOME/.nvm
if [ -s $NVM_DIR/nvm.sh ]; then
  source $NVM_DIR/nvm.sh
fi

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [[ -f /usr/local/share/zsh/site-functions/_aws ]]; then
  source /usr/local/share/zsh/site-functions/_aws
fi

if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
fi

# Base16 Shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

source $ZSH/custom/prompt.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.cargo/bin:$PATH"

# SSH key management
# `which envoy 2>&1 > /dev/null`
# if [[ $? -eq 0 ]]; then
#   # envoy -t ssh-agent -a id_rsa id_rsa_old
#   source <(envoy -p)
# fi

[ -f ~/.dotfiles/z/z.sh ] && source ~/.dotfiles/z/z.sh
