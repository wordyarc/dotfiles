export GPG_TTY="$(tty)"
export MANPAGER='bat -l man -p'

eval "$(atuin init zsh --disable-up-arrow)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
