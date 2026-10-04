#!/usr/bin/env bash
#
# Install the configs tracked in this repository into $HOME.
#
# Usage: install-config.sh [--dry-run] [--delete]
#
#   --dry-run  show what would change as a diff, without touching anything
#   --delete   also remove everything in ~/.config/<app> that is not tracked here

set -euo pipefail

export GIT_LITERAL_PATHSPECS=1

root_files=(.zshenv .zprofile .zshrc .gitconfig)

usage() {
  echo "usage: ${0##*/} [--dry-run] [--delete]" >&2
  exit 2
}

install_file() {
  local file=$1 target=$HOME/$1

  cmp -s "$file" "$target" && return
  if $dry_run; then
    diff -uN "$target" "$file" || true
    return
  fi

  mkdir -p "${target%/*}"
  cp -p "$file" "$target"
  echo "$file"
}

prune_dir() {
  local dir=$1 target file

  [[ -d $HOME/$dir ]] || return 0

  while IFS= read -r -d '' target; do
    file=${target#"$HOME/"}
    git ls-files --error-unmatch -- "$file" >/dev/null 2>&1 && continue
    if $dry_run; then
      echo "would delete $file"
      continue
    fi

    rm -f "$target"
    echo "deleted $file"
  done < <(find "$HOME/$dir" ! -type d -print0)

  $dry_run || find "$HOME/$dir" -depth -type d -empty -delete
}

dry_run=false
delete=false
for arg; do
  case $arg in
    --dry-run) dry_run=true ;;
    --delete) delete=true ;;
    *) usage ;;
  esac
done

cd "$(dirname "${BASH_SOURCE[0]}")"

app_dirs=()
last_dir=
while IFS= read -r -d '' file; do
  [[ -f $file ]] || continue
  install_file "$file"

  if [[ $file == .config/*/* ]]; then
    dir=${file#.config/}
    dir=.config/${dir%%/*}
    [[ $dir == "$last_dir" ]] || app_dirs+=("$dir")
    last_dir=$dir
  fi
done < <(git ls-files -z -- .config "${root_files[@]}")

if $delete; then
  for dir in ${app_dirs[@]+"${app_dirs[@]}"}; do
    prune_dir "$dir"
  done
fi
