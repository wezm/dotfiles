# Wes' Dot Files

My repo for configuration files, managed by [dot].

## Installation

1. Install `git` and `rust`. If on a non-GNU system (E.g. BSD), install `gmake`.
3. Clone files: `git clone --recursive git@github.com:wezm/dotfiles.git`
2. Install `dot`, either by building from source or downloading a binary.
   (`cargo install --git https://github.com/ubnt-intrepid/dot.git`)
5. Link files: `/home/wmoore/.cargo/bin/dot link`
7. Open [Neovim] and install plugins: `:PlugInstall`

### Transcript

The following is a transcript of the steps taken to install dotfiles in a fresh
[Void Linux] installation.

**Note** It's assumed you're sshed into the new machine with agent forwarding
enabled (to clone repos).

    # xbps-install -Suv cargo git base-devel
    % cargo install --git https://github.com/ubnt-intrepid/dot.rs.git
    % /home/wmoore/.cargo/bin/dot clone wezm
    % cd .dotfiles
    % git submodule update --init
    % /home/wmoore/.cargo/bin/dot link
    % base16_default-dark
    # xbps-install neovim
    nvim :PlugInstall

## gsettings

### Monospace font

    gsettings set org.gnome.desktop.interface monospace-font-name 'PragmataPro Mono Regular 10'

### HiDPI

    gsettings set org.gnome.desktop.interface scaling-factor 2

### Location services

    gsettings set org.gnome.system.location enabled true

[dot]: https://github.com/ubnt-intrepid/dot
[Void Linux]: http://www.voidlinux.eu/
[Neovim]: https://neovim.io/
