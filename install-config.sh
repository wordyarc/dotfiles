#!/usr/bin/env bash
#
# Install the configs tracked in this repository: root files into $HOME,
# everything under .config/ into $XDG_CONFIG_HOME.
#
# Usage: install-config.sh [--dry-run] [--delete]
#
#   --dry-run  show what would change as a diff, without touching anything
#   --delete   also remove everything in $XDG_CONFIG_HOME/<app> that is not tracked here

set -euo pipefail

export GIT_LITERAL_PATHSPECS=1

root_files=(.zshenv .zprofile .zshrc .gitconfig)

usage() {
  echo "usage: ${0##*/} [--dry-run] [--delete]"
}

target_path() {
  local file=$1

  if [[ $file == .config/* ]]; then
    echo "$config_home/${file#.config/}"
  else
    echo "$HOME/$file"
  fi
}

install_file() {
  local file=$1 target status=0

  target=$(target_path "$file")
  cmp -s "$file" "$target" && return
  if $dry_run; then
    diff -uN "$target" "$file" || status=$?
    (( status <= 1 ))
    return
  fi

  mkdir -p "${target%/*}"
  cp -p "$file" "$target"
  echo "$target"
}

prune_dir() {
  local dir=$1 target_dir target file

  target_dir=$(target_path "$dir")
  [[ -d "$target_dir" ]] || return 0

  while IFS= read -r -d '' target; do
    file=$dir/${target#"$target_dir/"}
    git ls-files --error-unmatch -- "$file" >/dev/null 2>&1 && continue
    if $dry_run; then
      echo "would delete $target"
      continue
    fi

    rm -f "$target"
    echo "deleted $target"
  done < <(find "$target_dir" ! -type d -print0)

  $dry_run || find "$target_dir" -depth -type d -empty -delete
}

dry_run=false
delete=false
for arg; do
  case $arg in
    --dry-run) dry_run=true ;;
    --delete) delete=true ;;
    --help|-h) usage; exit 0 ;;
    *) usage >&2; exit 2 ;;
  esac
done

cd "$(dirname "${BASH_SOURCE[0]}")"
config_home=${XDG_CONFIG_HOME:-$HOME/.config}

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
