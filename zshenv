system=`uname -s`

# De-duplicate PATH (thanks Ben)
typeset -U PATH

if [[ "$system" = "OpenBSD" ]]; then
  export LC_CTYPE=en_AU.UTF-8
fi

if [[ -d /usr/local/bin ]]; then
  export PATH="/usr/local/bin:$PATH"
fi

if [[ -d /usr/local/sbin ]]; then
  export PATH="/usr/local/sbin:$PATH"
fi

if [[ -d "$HOME/Library/Python/2.7/bin" ]]; then
  export PATH="$HOME/Library/Python/2.7/bin:$PATH"
fi

if [[ -d "$HOME/.cargo/bin" ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

command -v yarn > /dev/null
if [[ $? -eq 0 ]]; then
  export PATH="$PATH:$(yarn global bin --offline)"
elif [[ -d "$HOME/.yarn/bin" ]]; then
  export PATH="$HOME/.yarn/bin:$PATH"
fi

if [[ -d "$HOME/.local/bin" ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

[ -d ~/.local/opt/mercury-2020-04-15/bin ] && export PATH="$HOME/.local/opt/mercury-2020-04-15/bin:$PATH"

command -v nvim > /dev/null
if [[ $? -eq 0 ]]; then
  export EDITOR=nvim
  alias vim=nvim
elif [[ -f /Applications/MacVim.app/Contents/MacOS/Vim ]]; then
  export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
else
  export EDITOR=vim
fi

export CUCUMBER_FORMAT=pretty

export GOPATH=$HOME/Source/Go
if [[ -d "$GOPATH/bin" ]]; then
  export PATH="$PATH:$GOPATH/bin"
fi

# Make PATH uniq
# echo $PATH | awk -v ORS=: -F: '{ for (i = 1; i < NF; i++) { if (!seen[$i]) print $i; seen[$i] = 1 } }' }

if [[ "$system" = "Darwin" ]]; then
  export VAGRANT_DEFAULT_PROVIDER=vmware_fusion
fi

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --color=never'
export FZF_ALT_C_COMMAND='fd --type d . --color=never'
export FZF_DEFAULT_OPTS="--exact --history=$HOME/.cache/fzfhistory"
export FZF_TMUX="0"

# skim
export SKIM_DEFAULT_COMMAND="fd --type f --color=never"
export SKIM_DEFAULT_OPTIONS="--exact --history=$HOME/.cache/skimhistory"

# git-grab
# https://github.com/wezm/git-grab
export GRAB_HOME="$HOME/Source"

# Tilix integration
if [ $TERMINIX_ID ] || [ $VTE_VERSION ]; then
  if [[ -f /etc/profile.d/vte.sh ]]; then
    source /etc/profile.d/vte.sh
  elif [[ -f /usr/local/etc/profile.d/vte.sh ]]; then
    source /usr/local/etc/profile.d/vte.sh
  fi
fi

# Use preview in fzf
if [ -x ~/.vim/plugged/fzf.vim/bin/preview.rb ]; then
  export FZF_CTRL_T_OPTS="--preview '~/.vim/plugged/fzf.vim/bin/preview.rb {} | head -200'"
fi

# OPAM configuration
if [[ -d  "$HOME/.opam/opam-init/init.zsh" ]]; then
  . "$HOME/.opam/opam-init/init.zsh"
fi

# BuckleScript
if [[ -d "$HOME/Source/bucklescript/lib" ]]; then
  export PATH="$HOME/Source/bucklescript/lib:$PATH"
  export BSC_LIB="$HOME/Source/bucklescript/jscomp/stdlib"
fi

export NVIM_GTK_PREFER_DARK_THEME=1

# Alacritty
command -v gsettings > /dev/null
if [[ $? -eq 0 ]]; then
  gnome_scaling_factor=$(gsettings get org.gnome.desktop.interface scaling-factor | awk '{ print $2 }')
  if [[ $gnome_scaling_factor -gt 0 ]]; then
    export WINIT_HIDPI_FACTOR=$gnome_scaling_factor
  else
    export WINIT_HIDPI_FACTOR=1
  fi
fi

# Smooth scrolling in Firefox
export MOZ_USE_XINPUT2=1

# Some defaults for less
export LESS="-FRX"

# Perl and CPAN
PATH="/home/wmoore/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/wmoore/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/wmoore/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/wmoore/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/wmoore/perl5"; export PERL_MM_OPT;

# Deno
if [[ -d "$HOME/.deno/bin" ]]; then
  export PATH="$HOME/.deno/bin:$PATH"
fi

source "$HOME/.zshenv_private"
