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

# Cargo
alias cb='cargo build'
alias cc='cargo check'
alias cr='cargo run'
alias ct='cargo test'
alias cu='cargo update'
alias fmt='cargo fmt'

if command -v eza > /dev/null; then
  # Use eza as ls
  # Override default oh-my-zsh directories aliases with eza ones
  # https://github.com/eza-community/eza
  unalias ls
  unalias lsa
  alias l='eza'
  alias ls='eza'
  alias ll='eza -l'
  alias la='eza -la'
elif command -v lsd > /dev/null; then
  # Use lsd as ls
  # https://github.com/lsd-rs/lsd
  unalias ls
  unalias lsa
  alias l='lsd'
  alias ls='lsd'
  alias ll='lsd -l'
  alias la='lsd -la'
fi

alias zswap='sudo grep -R . /sys/kernel/debug/zswap'

alias ip='ip --color'

# Use zenith as top
if command -v zenith > /dev/null; then alias top="zenith -d0 -n0 --disable-history"; fi

# Use bat as cat
if command -v bat > /dev/null; then
  alias cat=bat;
  alias b=bat
elif command -v batcat > /dev/null; then
  # Urgh Debian
  alias cat=batcat;
  alias b=batcat
fi

# Urgh Debian
if command -v fdfind > /dev/null; then
  alias fd=fdfind
fi

# Use bsdtar as tar
if command -v bsdtar > /dev/null; then alias tar=bsdtar; fi

# Zed
if command -v zeditor > /dev/null; then
  alias zed=zeditor
elif command -v /usr/bin/z > /dev/null; then
  # Chimera
  alias zed=/usr/bin/z
fi

