catroll() {
  local -a patterns prune
  local first pattern file

  while [[ "$1" == "-I" && -n "$2" ]]; do
    patterns+=("$2")
    shift 2
  done

  if (( ${#patterns[@]} )); then
    prune=('(')
    first=1
    for pattern in "${patterns[@]}"; do
      (( first )) || prune+=(-o)
      prune+=(-path "*/$pattern/*" -o -path "*/$pattern" -o -name "$pattern")
      first=0
    done
    prune+=(')' -prune)
    find . "${prune[@]}" -o -type f -print0
  else
    find . -type f -print0
  fi | while IFS= read -r -d '' file; do
    print -r -- "### $file"
    command cat "$file"
    print
  done
}

pubkey() {
  pbcopy < "$HOME/.ssh/id_rsa.pub"
  print '=> Public key copied to pasteboard.'
}

shrug() {
  print -rn -- '¯\_(ツ)_/¯' | pbcopy
  print '=> Copied to pasteboard.'
}
