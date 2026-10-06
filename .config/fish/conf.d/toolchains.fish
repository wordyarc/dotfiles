# -- Python ----------------------------------------------------
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

# -- Docker ----------------------------------------------------
set -gx DOCKER_DEFAULT_PLATFORM linux/amd64

# -- .NET ------------------------------------------------------
if set -q HOMEBREW_PREFIX
    set -gx DOTNET_ROOT "$HOMEBREW_PREFIX/opt/dotnet/libexec"
end

# -- vcpkg -----------------------------------------------------
set -gx VCPKG_ROOT "$HOME/develop/vcpkg"

# -- Paths -----------------------------------------------------
set -l toolchain_paths

if set -q JAVA_HOME
    set -a toolchain_paths "$JAVA_HOME/bin"
end

set -a toolchain_paths \
    "$ASDF_DATA_DIR/shims" \
    "$HOMEBREW_PREFIX/opt/openjdk/bin" \
    "$HOME/develop/flutter/bin" \
    "$VCPKG_ROOT" \
    "$HOMEBREW_PREFIX/opt/rustup/bin" \
    "$HOME/.cargo/bin"

fish_add_path --global --move --path $toolchain_paths
fish_add_path --global --move --append --path "$HOME/.pub-cache/bin"
