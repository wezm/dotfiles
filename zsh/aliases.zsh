# Git
unalias grv
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gf='git fetch'
alias gco='git checkout'
gmo () {
  git merge "origin/$(current_branch)"
}
alias gcob='git checkout -b'
gpuo () {
  git push -u origin $(current_branch)
}

# Arch/AUR
aurget () {
  git clone "https://aur.archlinux.org/${1}.git"
  cd "$1"
}

# Tig
alias t='tig'
alias ts='tig status'
alias tb='tig blame'
alias th='tig stash'

# Rails
alias ttr='touch tmp/restart.txt'

# Cargo
alias cb='cargo build'
alias cc='cargo check'
alias cr='cargo run'
alias ct='cargo test'
alias cu='cargo update'

# Use exa as ls
if command -v exa > /dev/null; then
  # Override default oh-my-zsh directories aliases with exa ones
  # https://the.exa.website/
  unalias ls
  unalias lsa
  alias l='exa'
  alias ls='exa'
  alias ll='exa -l'
  alias la='exa -la'
fi

alias zswap='sudo grep -R . /sys/kernel/debug/zswap'

alias ip='ip --color'

# Use zenith as top
if command -v zenith > /dev/null; then alias top="zenith -d0 -n0 --disable-history"; fi

# Use bat as cat
if command -v bat > /dev/null; then alias cat=bat; fi

