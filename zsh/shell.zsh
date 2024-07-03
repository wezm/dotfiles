function fix-colours() {
  # Base16 Shell
  BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
  [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
}

function say() {
  echo $@ | festival --tts
}

# Take a number like 1836674418 and print it as mymr

function fourcc() {
  echo "$1" | awk '{ printf("0x%X", $0) }' | dtool h2s
}
