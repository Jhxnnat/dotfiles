Computer configurations files in case of emergency, or reinstall...
Managed using [chezmoi](https://www.chezmoi.io/install/#one-line-package-install)

```bash
# pmos/alpine | garmond | 15IRH10
apk add fish wl-clipboard syncthing tailscale chezmoi
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
