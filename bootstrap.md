# Bootstrap

Everything that is installed by hand, in setup order. Run `brew bundle` first.

## Frameworks & toolchains

Run from a shell that already has these dotfiles applied: the configs export
the install locations (`ZSH`, `SDKMAN_DIR`, `XDG_DATA_HOME`).

**oh-my-zsh** — from zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
```

**tpm** — then `prefix + I` to fetch plugins

```sh
git clone https://github.com/tmux-plugins/tpm "$XDG_DATA_HOME/tmux/plugins/tpm"
```

**SDKMAN**

```sh
curl -s "https://get.sdkman.io?rcupdate=false" | bash
```

**rustup** — required by the `cargo` entries in `Brewfile`

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
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

**fisher** — already tracked in `.config/fish/functions`, only plugins need fetching

```sh
fisher update
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
