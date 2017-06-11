system=`uname -s`

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

`which yarn 2>&1 > /dev/null`
if [[ $? -eq 0 ]]; then
  export PATH="$PATH:`yarn global bin`"
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

export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

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
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS="--exact --history=$HOME/.fzfhistory"
export FZF_TMUX="0"

# TIlix/Terminix integration
if [ $TERMINIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

source "$HOME/.zshenv_private"
