[[ -o interactive ]] || return

source "$ZDOTDIR/bootstrap/homebrew.zsh"

mkdir -p "$XDG_CACHE_HOME/zsh" "$XDG_STATE_HOME/zsh"

_zsh_source() {
  local target="$ZDOTDIR/$1"
  local file

  if [[ -d "$target" ]]; then
    for file in "$target"/*.zsh(N); do
      source "$file"
    done
  else
    source "$target"
  fi
}

_zsh_source core
_zsh_source framework/oh-my-zsh.zsh
_zsh_source framework/plugins.zsh

_zsh_source integrations
_zsh_source toolchains
_zsh_source user

[[ -f "$ZDOTDIR/local.zsh" ]] && _zsh_source local.zsh

_zsh_source framework/final.zsh

unfunction _zsh_source
