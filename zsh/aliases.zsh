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
  git clone https://aur.archlinux.org/${1}.git
}

# Tig
alias t='tig'
alias ts='tig status'
alias tb='tig blame'

# Vimish stuff
alias vless="/usr/share/nvim/runtime/macros/less.sh"
alias vf="vifm"

# Capistrano
alias capss="cap staging ssh"
alias capsc="cap staging console"
alias capsd="cap staging deploy"
alias capps="cap production ssh"
alias cappc="cap production console"
alias cappd="cap production deploy"

# Other
alias ff='mdfind -onlyin . -name'
alias fff='mdfind -name'
alias ffff='mdfind -onlyin .'

# Rails
alias ttr='touch tmp/restart.txt'
unalias rg

# Projects, mnemonic: j = jump
alias jm='cd ~/Projects/Musicast'
alias jl='cd ~/Projects/pkb'

# Cargo
alias cb='cargo build'
alias ct='cargo test'
alias cr='cargo run'
alias cu='cargo update'

which exa 2>&1 > /dev/null
if [[ $? -eq 0 ]]; then
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
