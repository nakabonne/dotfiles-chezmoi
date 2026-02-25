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

```
brew install chezmoi
```

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
- `run_once_before_bootstrap.sh.tmpl` bootstraps package managers (`brew`, `mise`).
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
