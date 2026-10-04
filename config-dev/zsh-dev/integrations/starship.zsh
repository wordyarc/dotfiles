if command -v starship >/dev/null; then
  export VIRTUAL_ENV_DISABLE_PROMPT=1
  export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"
  eval "$(starship init zsh)"
fi
