#!/bin/sh

source "$HOME/.dotfiles/private/restic-backup-$(hostname).sh"
export RESTIC_PASSWORD_FILE="$HOME/.dotfiles/private/restic-backup-$(hostname)-password.txt"

# restic init

restic backup \
  --exclude target \
  --exclude ~/Downloads \
  --exclude ~/Source \
  --exclude ~/.bundle \
  --exclude ~/.cabal \
  --exclude ~/.cache \
  --exclude ~/.cargo \
  --exclude ~/.crenv \
  --exclude ~/.CLion\* \
  --exclude ~/.dbeaver-drivers \
  --exclude ~/.dbeaver4 \
  --exclude ~/.debug \
  --exclude ~/.dmrc \
  --exclude ~/.docker \
  --exclude ~/.dub \
  --exclude ~/.eclipse \
  --exclude ~/.energia15 \
  --exclude ~/.esd_auth \
  --exclude ~/.fnm \
  --exclude ~/.gem \
  --exclude ~/.ghc \
  --exclude ~/.Idea\* \
  --exclude ~/.idris \
  --exclude ~/.java \
  --exclude ~/.lesshst \
  --exclude ~/.mindustry \
  --exclude ~/.mozilla \
  --exclude ~/.npm \
  --exclude ~/.nv \
  --exclude ~/.nvidia-settings-rc \
  --exclude ~/.opam \
  --exclude ~/.oracle_jre_usage \
  --exclude ~/.password-store \
  --exclude ~/.pki \
  --exclude ~/.rancher \
  --exclude ~/.rustup \
  --exclude ~/.ssr \
  --exclude ~/.stack \
  --exclude ~/.subversion \
  --exclude ~/.swt \
  --exclude ~/.tig_history \
  --exclude ~/.vimrc_background \
  --exclude ~/.vimundo \
  --exclude ~/.vscode \
  --exclude ~/.xargo \
  --exclude ~/.yarn \
  --exclude ~/.dotfiles/nvm \
  --exclude ~/.dotfiles/yarn \
  --exclude ~/.dotfiles/rbenv \
  --exclude ~/.dotfile/config/*/Cache \
  --exclude ~/.dotfiles/config/nvim/plugged \
  --exclude ~/.dotfiles/config/Atom \
  --exclude ~/.dotfiles/config/Code \
  --exclude ~/.dotfiles/config/Mailspring \
  --exclude ~/.dotfiles/config/Insomnia \
  --exclude ~/.dotfiles/config/Mattermost \
  --exclude ~/.dotfiles/config/chromium \
  --exclude ~/.dotfiles/config/google-chrome \
  --exclude ~/.dotfiles/config/libreoffice \
  --exclude ~/.dotfiles/config/mimeapps.list \
  --exclude ~/.dotfiles/config/neofetch \
  --exclude ~/.dotfiles/config/pulse \
  --exclude ~/.dotfiles/config/discord \
  --exclude ~/.dotfiles/config/GIMP \
  --exclude ~/.dotfiles/config/Slack \
  --exclude ~/.dotfiles/config/skypeforlinux \
  --exclude ~/.dotfiles/config/Uniflash \
  --exclude ~/.dotfiles/config/yarn \
  --exclude ~/.local/share \
  ~
