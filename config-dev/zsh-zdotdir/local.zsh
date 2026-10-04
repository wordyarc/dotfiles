# Toolchain environment

export DOTNET_ROOT="$HOMEBREW_PREFIX/opt/dotnet/libexec"
export VCPKG_ROOT="$HOME/develop/vcpkg"

# Rust

source "$HOME/.cargo/env"

# PATH

path=(
  # Development toolchains
  "$HOMEBREW_PREFIX/opt/openjdk/bin"
  "$HOME/develop/flutter/bin"
  "$VCPKG_ROOT"

  $path

  # User-installed executables
  "$HOME/.pub-cache/bin"

  # Desktop application CLIs
  "/Applications/Docker.app/Contents/Resources/bin"
  "$HOME/.lmstudio/bin"
  "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
)
