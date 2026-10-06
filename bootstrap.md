# Bootstrap

Run `./bootstrap.sh` first. It installs Homebrew, rustup with the stable
toolchain and the `Brewfile`, applies the tracked configs (`install-config.sh`),
oh-my-zsh, tpm with its plugins and the fisher plugins. It is safe to re-run.
The `mas` entries in `Brewfile` need an App Store sign-in beforehand.

Everything below is still installed by hand, in setup order.

## Toolchains

Run from a shell that already has these dotfiles applied: the configs export
the install locations (`SDKMAN_DIR`, `VCPKG_ROOT`).

**SDKMAN**

```sh
curl -s "https://get.sdkman.io?rcupdate=false" | bash
```

**vcpkg**

```sh
git clone https://github.com/microsoft/vcpkg.git "$VCPKG_ROOT"
"$VCPKG_ROOT/bootstrap-vcpkg.sh"
```

**Flutter**

```sh
git clone -b stable https://github.com/flutter/flutter.git ~/develop/flutter
```

## Managed by their own installer

**[JetBrains Toolbox](https://www.jetbrains.com/toolbox-app/)**

- Air
- Android Studio
- DataGrip
- Fleet
- GoLand
- IntelliJ IDEA
- PyCharm
- Rider
- RustRover
- WebStorm

**SDKMAN**

- `java` — Temurin 11, 17, 21, 25
- `kotlintoolchain`

## Apps

- [AeroSpace](https://github.com/nikitabobko/AeroSpace)
- [Alacritty](https://alacritty.org)
- [AmneziaVPN](https://amnezia.org)
- [AppCleaner](https://freemacsoft.net/appcleaner/)
- [Arc](https://arc.net)
- CleanupBuddy
- [Cursor](https://cursor.com)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Firefox](https://www.mozilla.org/firefox/)
- [Ghostty](https://ghostty.org)
- [Helium](https://helium.computer)
- [Ice](https://github.com/jordanbaird/Ice)
- [IINA](https://iina.io)
- [ImHex](https://imhex.werwolv.net)
- [iTerm2](https://iterm2.com)
- [kitty](https://sw.kovidgoyal.net/kitty/)
- [Logi Options+](https://www.logitech.com/software/logi-options-plus.html)
- [Microsoft Edge](https://www.microsoft.com/edge)
- [Obsidian](https://obsidian.md)
- [Pearcleaner](https://github.com/alienator88/Pearcleaner)
- [Raycast](https://www.raycast.com)
- [Steam](https://store.steampowered.com/about/)
- [Telegram](https://telegram.org)
- [Visual Studio Code](https://code.visualstudio.com)
- [Zed](https://zed.dev)
- [Zen](https://zen-browser.app)
