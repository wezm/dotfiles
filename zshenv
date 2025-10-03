system=$(uname -s)
host=$(hostname)

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

if [[ -d "$HOME/.local/bin" ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# this is after .local so that toolchains installed from musl.rs don't take precedence
if [[ "$host" = "chimera-yoga" ]]; then
  export CARGO_HOME="$HOME/.cargo-chimera"
  export PATH="$CARGO_HOME/bin:$PATH"
elif [[ -d "$HOME/.cargo/bin" ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Nim
if [[ -d "$HOME/.nimble/bin" ]]; then
  export PATH="$HOME/.nimble/bin:$PATH"
fi

# Use helix; nvim; vim as editor in that order
# command -v helix> /dev/null
# if [[ $? -eq 0 ]]; then
#   export EDITOR=helix
# else
#   command -v nvim> /dev/null
#   if [[ $? -eq 0 ]]; then
#     export EDITOR=nvim
#   else
#     export EDITOR=vim
#   fi
# fi
command -v nvim> /dev/null
if [[ $? -eq 0 ]]; then
  export EDITOR=nvim
else
  export EDITOR=vim
fi

# alias vim to nvim if present
command -v nvim> /dev/null
if [[ $? -eq 0 ]]; then
  alias vim=nvim
fi

export CUCUMBER_FORMAT=pretty

export GOPATH=$HOME/Source/Go
if [[ -d "$GOPATH/bin" ]]; then
  export PATH="$PATH:$GOPATH/bin"
fi

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

# Make Valgrind work
if [[ -f /etc/os-release ]]; then
  grep -q '^ID=arch' /etc/os-release && export DEBUGINFOD_URLS="https://debuginfod.archlinux.org/"
fi

# Janet
export JANET_TREE=$HOME/.local/jpm_tree
export JANET_PATH=$HOME/.local/jpm_tree/lib

source "$HOME/.zshenv_private"
if [ -e /home/wmoore/.nix-profile/etc/profile.d/nix.sh ]; then . /home/wmoore/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Scala
if [[ -d "$HOME/.local/share/coursier/bin" ]]; then
  export PATH="$HOME/.local/share/coursier/bin:$PATH"
fi
