function accept-test() {
  mv "$1" "${1%.out}.exp"
}

# Determine if diff is BSD or GNU
function detect_diff() {
  # FreeBSD diff 20220309

  # diff (GNU diffutils) 3.12
  local version
  version=$(diff --version | head -1)
  case "$version" in
    *"BSD diff"*)
      echo -n BSD
      ;;
    *"GNU diff"*)
      echo -n GNU
      ;;
    *)
      return 1
      ;;
  esac
}

function diff_pdf () {
    local dialect
    dialect=$(detect_diff)
    case "$dialect" in
        BSD)
            bsd_diff_pdf "$@"
            ;;
        GNU)
            gnu_diff_pdf "$@"
            ;;
        *)
            echo "unknown diff dialect"
            return 1
            ;;
    esac
}


function gnu_diff_pdf () {
    { [ ! -s "$1" ] && [ ! -s "$2" ]; } ||
    diff -u -a \
      --show-function-line='^[0-9][0-9]* 0 obj'	\
      -I '^/FontName' \
      -I '^/BaseFont' \
      -I '^/MediaBox' \
      -I '^/BleedBox' \
      -I '^/TrimBox' \
      -I '^<pdf:Producer' \
      -I '^<xmp:CreateDate' \
      -I '^<xmp:MetadataDate' \
      -I '^<xmp:ModifyDate' \
      -I '^<xmpMM:DocumentID' \
      -I '^\(<<\)*/ModDate' \
      -I '^\(<<\)*/CreationDate' \
      -I '^\(<<\)*/Producer' \
      -I '^[0-9]* 00000 n $' \
      -I '^[1-9][0-9]*$' \
      -I '^/ID \[<' \
      "$@"
}

function bsd_diff_pdf () {
    { [ ! -s "$1" ] && [ ! -s "$2" ]; } ||
    diff -u -a \
      --show-function-line='^[0-9][0-9]* 0 obj'	\
      -I '^/FontName' \
      -I '^/BaseFont' \
      -I '^/MediaBox' \
      -I '^/BleedBox' \
      -I '^/TrimBox' \
      -I '^<pdf:Producer' \
      -I '^<xmp:CreateDate' \
      -I '^<xmp:MetadataDate' \
      -I '^<xmp:ModifyDate' \
      -I '^<xmpMM:DocumentID' \
      -I '^(<<)*/ModDate' \
      -I '^(<<)*/CreationDate' \
      -I '^(<<)*/Producer' \
      -I '^[0-9]* 00000 n $' \
      -I '^[1-9][0-9]*$' \
      -I '^/ID \[<' \
      "$@"
}
