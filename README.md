# dotfiles

Dotfiles managed by [chezmoi](https://www.chezmoi.io/).

## Supported OS

- macOS
- Debian / Ubuntu

## Prerequisites

macOS

```sh
brew update
brew install chezmoi
```

Others

```sh
sh -c "$(curl -fsLS https://get.chezmoi.io)"
```

## Bootstrap

```
cd ~
chezmoi init https://github.com/nakabonne/dotfiles-chezmoi.git
```

```
chezmoi apply -v
```

## How this repository works

- This repository is the chezmoi source directory.
- Files prefixed with `dot_` map to files in `$HOME`.
- When you run `chezmoi apply`, it runs these:
  - `run_once_before_bootstrap.sh.tmpl`: bootstraps package managers (`brew` on macOS, `mise` on both platforms).
  - `run_once_after_install.sh.tmpl`: installs configured tools via `mise install`, then runs `brew bundle` on macOS. On Debian-based systems everything is installed without sudo: CLI tools (`jq`, `neovim`, `fzf`, `starship`, `lazygit`) come from mise, and `tmux` is installed as an extracted AppImage under `$HOME/.local`.

### Pull the latest change

On any machine, you can pull and apply the latest changes from your repo with:

```bash
chezmoi update -v
```

### Edit dotfiles

Let's say you want to edit .bashrc.

```bash
chezmoi edit ~/.bashrc
```

```bash
chezmoi diff
```

```bash
chezmoi apply -v
```

### Push changes

```bash
chezmoi cd
```

```bash
git add -A
git commit -m "Update dotfiles"
git push
```

### Tool management

Runtime versions are defined in: `dot_config/mise/config.toml.tmpl`. On Linux this file also declares the CLI tools that `brew` manages on macOS.

After updates, run:

```bash
mise install
```

Tools installed via brew are defined in: `dot_Brewfile`.

After updates, run:

```bash
brew bundle --file "$HOME/.Brewfile"
```
