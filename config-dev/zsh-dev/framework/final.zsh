# Keep this phase last so highlighting can wrap every ZLE widget.
[[ -n ${HOMEBREW_PREFIX:-} && -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] &&
  source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
