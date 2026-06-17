Computer configurations files in case of emergency, or reinstall...
Managed using [chezmoi](https://www.chezmoi.io/install/#one-line-package-install)

```bash
# Arch | Garmond | 15IRH10
pacman -Syu fish emacs-wayland niri mako rofi waybar wl-clipboard syncthing tailscale chezmoi
```

```bash
ssh-keygen
cat .ssh/id_ecdsa.pub | wl-copy
# add keys to github/codeberg
```

```bash
# chezmoi
chezmoi init --apply Jhxnnat
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

```bash
systemctl enable --now tailscaled
tailscale up
```

**Kmonad:**
- https://github.com/kmonad/kmonad/releases
```bash
./setup.sh
systemctl enable --now kmonad.service
systemctl daemon-reload
```
