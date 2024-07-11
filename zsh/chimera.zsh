function cbuild-update-check() {
    ( cd "$GRAB_HOME/github.com/wezm/cports"
      for pkg in $(rg -g template.py -l maintainer.\*wezm); do
        ./cbuild update-check $(dirname $pkg)
      done
    )
}

function cbuild-upkg() {
  ( set -eu
    version="$1"
    package="$2"
    template="$package/template.py"

    if [[ ! -e ./cbuild ]]; then
      echo "$0 must be run from cports"
      return 1
    fi

    if [[ -z "$template" ]]; then
      echo "Usage $0 version repo/package"
      return 1
    fi

    #pkgver = "1.35.2"
    sed -E "s/^pkgver = \"[^\"]+\"/pkgver = \"$version\"/" < "$template" > "${template}.tmp"
    mv "${template}.tmp" "$template"
    ./cbuild prepare-upgrade "$package"
  )
}
