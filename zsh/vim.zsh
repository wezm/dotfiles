# This will open files at the specified line in vim if the last argument
# matches filename:line. E.g. app/models/user.rb:123
function v() {
  last_arg="${@: -1}"

  parts=("${(s/:/)last_arg}")
  file=$parts[1]
  line_number=$parts[2]

  if [[ $line_number -gt 0 ]]; then
    vim "+$line_number" "$file"
  else
    vim $@
  fi
}
