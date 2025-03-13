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

# bundler is loader after the rails plugin to that stuff works properly
plugins=(cargo extract git history-substring-search postgres)

source $ZSH/oh-my-zsh.sh

# Fix for broken zsh prompt
unsetopt auto_name_dirs

# frum - Ruby version manager
if command -v frum > /dev/null; then
  export FRUM_DIR="$HOME/.config/frum"
  eval "$(frum init)"
fi

if [[ -f /usr/local/share/zsh/site-functions/_aws ]]; then
  source /usr/local/share/zsh/site-functions/_aws
fi

# crenv
if [[ -d "$HOME/.crenv/bin" ]]; then
  export PATH="$HOME/.crenv/bin:$PATH"
  eval "$(crenv init -)"
fi

# fzf
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
elif [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
  # Debian
  source /usr/share/doc/fzf/examples/key-bindings.zsh
elif [[ -f /usr/local/share/examples/fzf/shell/key-bindings.zsh ]]; then
  source /usr/local/share/examples/fzf/shell/key-bindings.zsh
fi

# fnm - Fast Node Manager
command -v fnm > /dev/null && eval "`fnm env --shell zsh`"
command -v yarn > /dev/null
if [[ $? -eq 0 ]]; then
  export PATH="$PATH:$(yarn global bin --offline)"
elif [[ -d "$HOME/.yarn/bin" ]]; then
  export PATH="$HOME/.yarn/bin:$PATH"
fi

# deno
if [[ -d "$HOME/.deno/bin" ]]; then
  export PATH="$HOME/.deno/bin:$PATH"
fi

source $ZSH/custom/prompt.sh

command -v zoxide > /dev/null && eval "$(zoxide init zsh)"

# OPAM configuration
. /home/wmoore/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
