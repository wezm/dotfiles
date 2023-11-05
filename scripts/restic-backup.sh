#!/bin/sh

hostname=$(uname -n)
if [ "$hostname" = "arch-torrent" ]; then
  hostname="torrent"
fi

. "$HOME/.dotfiles/private/restic-backup-${hostname}.sh"
export RESTIC_PASSWORD_FILE="$HOME/.dotfiles/private/restic-backup-${hostname}-password.txt"

# restic init

restic backup \
  --exclude target \
  --exclude ~/Downloads \
  --exclude ~/Source \
  \
  --exclude ~/.android \
  --exclude ~/.arduino15 \
  --exclude ~/.aspnet \
  --exclude ~/.atom \
  --exclude ~/.audacity-data \
  --exclude ~/.azurefunctions \
  --exclude ~/.bundle \
  --exclude ~/.cabal \
  --exclude ~/.cache \
  --exclude ~/.cargo \
  --exclude ~/.CLion2019.1 \
  --exclude ~/.CLion2019.2 \
  --exclude ~/.CLion2019.3 \
  --exclude ~/.cmake \
  --exclude ~/.crenv \
  --exclude ~/.dbeaver-drivers \
  --exclude ~/.dbeaver4 \
  --exclude ~/.debug \
  --exclude ~/.dotnet \
  --exclude ~/.eclipse \
  --exclude ~/.elm \
  --exclude ~/.energia15 \
  --exclude ~/.enve \
  --exclude ~/.filite \
  --exclude ~/.fnm \
  --exclude ~/.gem \
  --exclude ~/.ghc \
  --exclude ~/.gnome \
  --exclude ~/.gphoto \
  --exclude ~/.idea \
  --exclude ~/.idris \
  --exclude ~/.java \
  --exclude ~/.jssc \
  --exclude ~/.MCTranscodingSDK \
  --exclude ~/.mono \
  --exclude ~/.mozilla \
  --exclude ~/.mozilla.aerocool \
  --exclude ~/.node-gyp \
  --exclude ~/.npm \
  --exclude ~/.nuget \
  --exclude ~/.nv \
  --exclude ~/.omnisharp \
  --exclude ~/.oracle_jre_usage \
  --exclude ~/.parallel \
  --exclude ~/.pipewire-media-session \
  --exclude ~/.pki \
  --exclude ~/.purple \
  --exclude ~/.rustup \
  --exclude ~/.ssr \
  --exclude ~/.subversion \
  --exclude ~/.svg-buddy \
  --exclude ~/.swipl-dir-history \
  --exclude ~/.swt \
  --exclude ~/.templateengine \
  --exclude ~/.var \
  --exclude ~/.vscode \
  --exclude ~/.w3m \
  --exclude ~/.xargo \
  --exclude ~/.yarn \
  --exclude ~/.zenith \
  --exclude ~/.zgen.bk \
  \
  --exclude ~/.dotfiles/nvm \
  --exclude ~/.dotfiles/yarn \
  --exclude ~/.dotfiles/rbenv \
  --exclude ~/.dotfiles/config/\*/Cache \
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
