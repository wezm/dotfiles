# Wes' Dot Files

My repo for configuration files, managed by [dot].

## Installation

1. Install `git`
2. Install `dot`, either by building from source or downloading a binary.
   (`cargo install --git https://github.com/ubnt-intrepid/dot.git`)
3. Clone files: `dot clone wezm`
4. Checkout submodules: `git submodule update --init`
5. Link files: `dot link`
6. Run `base16_default-dark` once to set `~/.vimrc_background` to sync `vim`
   with the shell theme.
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

[dot]: https://github.com/ubnt-intrepid/dot
[Void Linux]: http://www.voidlinux.eu/
[Neovim]: https://neovim.io/
