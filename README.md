Computer configurations files in case of emergency, or os reinstall...
files managed using [chezmoi](https://www.chezmoi.io/install/#one-line-package-install)

```bash
# Arch
sudo pacman -Syu fish helix neovim zed niri mako fuzzel waybar wl-clipboard awww
```

```bash
# Fedora
sudo dnf install fish helix neovim niri waybar wl-clipboard
curl -f https://zed.dev/install.sh | sh
# awww: https://codeberg.org/LGFae/awww
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
# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

`
