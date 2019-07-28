#!/bin/sh

source "$HOME/.dotfiles/private/restic-backup-$(hostname).sh"
export RESTIC_PASSWORD_FILE="$HOME/.dotfiles/private/restic-backup-$(hostname)-password.txt"

# restic init

restic backup \
  --exclude target \
  --exclude ~/Downloads \
  --exclude ~/Source \
  --exclude ~/.rustup \
  --exclude ~/.cargo \
  --exclude ~/.cache \
  --exclude ~/.Idea\* \
  --exclude ~/.CLion\* \
  --exclude ~/.bundle \
  --exclude ~/.cabal \
  --exclude ~/.opam \
  --exclude ~/.rancher \
  --exclude ~/.yarn \
  --exclude ~/.dub \
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
