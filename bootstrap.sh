#!/usr/bin/env bash
#
# Set up a machine from this repository: Homebrew, rustup and the Brewfile, the
# tracked configs, oh-my-zsh, tpm with its plugins and fisher plugins. Safe to
# re-run.
#
# Usage: bootstrap.sh
#
# Toolchains that are still installed by hand are listed in bootstrap.md.

set -euo pipefail

usage() {
  echo "usage: ${0##*/}"
}

warn() {
  echo "${0##*/}: $*" >&2
}

install_homebrew() {
  command -v brew >/dev/null && return

  if [[ ! -x /opt/homebrew/bin/brew ]]; then
    if [[ $(uname -s) != Darwin ]]; then
      warn "homebrew not found, skipping Brewfile"
      return 1
    fi
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  eval "$(/opt/homebrew/bin/brew shellenv)"
}

# The cargo entries in Brewfile need the keg-only rustup proxies on PATH, else brew bundle installs the rust formula.
install_rustup() {
  local rustup_bin
  rustup_bin=$(brew --prefix rustup)/bin

  [[ -x $rustup_bin/rustup ]] || brew install rustup
  export PATH=$rustup_bin:$PATH
  rustup toolchain list | grep -q '^stable-' || rustup toolchain install stable
  rustup default 2>/dev/null | grep -q '^stable-' || rustup default stable
  rustup component list --installed | grep -q '^rust-src' || rustup component add rust-src
}

install_packages() {
  export HOMEBREW_NO_ANALYTICS=1
  brew bundle --file Brewfile
}

install_oh_my_zsh() {
  local zsh_dir=$XDG_CONFIG_HOME/.oh-my-zsh

  [[ -d "$zsh_dir" ]] && return
  ZSH=$zsh_dir sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" \
    --unattended --keep-zshrc
}

install_tmux_plugins() {
  local tpm_dir=$XDG_DATA_HOME/tmux/plugins/tpm

  command -v tmux >/dev/null || { warn "tmux not found, skipping tmux plugins"; return; }
  [[ -d "$tpm_dir" ]] || git clone --depth 1 https://github.com/tmux-plugins/tpm "$tpm_dir"
  "$tpm_dir/bin/install_plugins"
}

install_fish_plugins() {
  command -v fish >/dev/null || { warn "fish not found, skipping fish plugins"; return; }
  fish -c 'fisher update'
}

for arg; do
  case $arg in
    --help|-h) usage; exit 0 ;;
    *) usage >&2; exit 2 ;;
  esac
done

cd "$(dirname "${BASH_SOURCE[0]}")"
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

if install_homebrew; then
  install_rustup
  install_packages
fi
./install-config.sh
install_oh_my_zsh
install_tmux_plugins
install_fish_plugins
