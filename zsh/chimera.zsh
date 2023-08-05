function cbuild-update-check() {
    ( cd "$GRAB_HOME/github.com/wezm/cports"
      for pkg in $(rg -g template.py -l maintainer.\*wezm); do
        ./cbuild update-check $(dirname $pkg)
      done
    )
}
