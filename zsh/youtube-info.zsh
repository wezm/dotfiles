function youtube-info() {
    if [[ -z "$1" ]]; then
      echo "Usage: youtube-info URL"
      exit 2
    fi
    youtube-dl -j "$1" | jaq '{title: .fulltitle, format: .format, width: .width, height: .height, fps: .fps, acodec: .acodec, vcodec: .vcodec, ext:.ext}'
}
