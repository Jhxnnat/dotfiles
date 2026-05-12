Computer configurations files in case of emergency, or reinstall...
Managed using [chezmoi](https://www.chezmoi.io/install/#one-line-package-install)

```bash
# Arch | Zaza | 300E4C
sudo pacman -Syu vim fish helix emacs niri mako rofi waybar wl-clipboard awww syncthing
```

```bash
# Fedora | Garmond | 15IRH10
sudo dnf install vim fish helix wl-clipboard syncthing
```

```bash
ssh-keygen
cat .ssh/id_ecdsa.pub | wl-copy
# add keys to github/codeberg
```

```bash
# chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply Jhxnnat
chezmoi diff
chezmoi apply
```

```bash
# cargo/rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

```bash
# pyenv
curl -fsSL https://pyenv.run | bash
```

``` bash
systemctl --user enable syncthing
systemctl --user start syncthing
# setup directories and so on
```

**Build Neovim:**
- https://github.com/neovim/neovim/blob/master/BUILD.md

**Kmonad:**
- https://github.com/kmonad/kmonad/releases
- https://github.com/kmonad/kmonad/blob/master/startup/kmonad%40.service
