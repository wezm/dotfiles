system=`uname -s`

if [[ "$system" = "OpenBSD" ]]; then
  export LC_CTYPE=en_AU.UTF-8
fi

# FIXME: Might duplicate
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

if [[ -d "$HOME/.rbenv/bin" ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
fi

$(which yarn 2>&1 > /dev/null)
if [[ $? -eq 0 ]]; then
  export PATH="$PATH:$(yarn global bin --offline)"
elif [[ -d "$HOME/.yarn/bin" ]]; then
  export PATH="$HOME/.yarn/bin:$PATH"
fi

if [[ -d "$HOME/.local/bin" ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

`which nvim 2>&1 > /dev/null`
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
export FZF_DEFAULT_OPTS="--exact --history=$HOME/.fzfhistory"
export FZF_TMUX="0"

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
$(which gsettings 2>&1 > /dev/null)
if [[ $? -eq 0 ]]; then
  gnome_scaling_factor=$(gsettings get org.gnome.desktop.interface scaling-factor | awk '{ print $2 }')
  if [[ $gnome_scaling_factor -gt 0 ]]; then
    export WINIT_HIDPI_FACTOR=$gnome_scaling_factor
  else
    export WINIT_HIDPI_FACTOR=1
  fi
fi

source "$HOME/.zshenv_private"
