# dotfiles

Dotfiles managed by [chezmoi](https://www.chezmoi.io/) with tooling managed by [mise](https://mise.jdx.dev/).

## Supported OS

- macOS
- Ubuntu (planned)

## Installation

You can clone this repo to wherever you want.

```bash
git clone https://github.com/nakabonne/dotfiles-chezmoi.git
```

## Bootstrap

All dependencies you need (including chezmoi and mise) will be automatically installed.

```bash
./init/setup.sh
```

The setup script installs `chezmoi` if needed, initializes this repository as the chezmoi source directory, and applies the managed files.

## How this repository works

- This repository is the chezmoi source directory.
- Files prefixed with `dot_` map to files in `$HOME`.
- `run_once_before_install.sh.tmpl` bootstraps package managers (`brew`, `mise`).
- `run_once_after_install.sh.tmpl` installs configured tools via `mise install` and runs `brew bundle` when a `Brewfile` exists.

Useful commands:

```bash
chezmoi status
chezmoi diff
chezmoi apply -v
```

## Tool management with mise

Runtime/tool versions are defined in:

- `dot_config/mise/config.toml`

After updates, run:

```bash
mise install
```
