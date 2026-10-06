# Toolchain environment

export DOCKER_DEFAULT_PLATFORM=linux/amd64

export DOTNET_ROOT="$HOMEBREW_PREFIX/opt/dotnet/libexec"
export VCPKG_ROOT="$HOME/develop/vcpkg"

# -- XDG -------------------------------------------------------
export LESSHISTFILE="$XDG_STATE_HOME/less/history"

# Development tools
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

export ANDROID_USER_HOME="$XDG_DATA_HOME/android"
export IPYTHONDIR="$XDG_DATA_HOME/ipython"

# Kotlin/Native
export KONAN_DATA_DIR="$XDG_CACHE_HOME/konan"

# AI CLI tools
export CLAUDE_CONFIG_DIR="$XDG_DATA_HOME/claude"
export CODEX_HOME="$XDG_DATA_HOME/codex"
export COPILOT_HOME="$XDG_DATA_HOME/copilot"
# -- XDG End ---------------------------------------------------

# sdkman
export SDKMAN_DIR="$XDG_DATA_HOME/sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# asdf
export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"
export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/asdf/.asdfrc"

# PATH
path=(
  "$JAVA_HOME/bin"
  # asdf-managed executables
  "$ASDF_DATA_DIR/shims"

  # Development toolchains
  "$HOMEBREW_PREFIX/opt/openjdk/bin"
  "$HOME/develop/flutter/bin"
  "$VCPKG_ROOT"
  "$HOMEBREW_PREFIX/opt/rustup/bin"
  "$HOME/.cargo/bin"

  $path

  # User-installed executables
  "$HOME/.pub-cache/bin"

  # Desktop application CLIs
  "/Applications/Docker.app/Contents/Resources/bin"
  "$HOME/.lmstudio/bin"
  "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
)

