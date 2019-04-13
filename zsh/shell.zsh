function fix_colours() {
  # Base16 Shell
  BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
  [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
}

function mdv() {
  (echo '<html>'; pulldown-cmark < "$1" ; echo '</html>') | elinks
}
