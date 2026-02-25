#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "[!] This bootstrap currently supports macOS only."
  exit 1
fi

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

if ! command -v chezmoi >/dev/null 2>&1; then
  echo "[i] Installing chezmoi"
  if command -v brew >/dev/null 2>&1; then
    brew install chezmoi
  else
    mkdir -p "$HOME/.local/bin"
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
    export PATH="$HOME/.local/bin:$PATH"
  fi
fi

if ! command -v chezmoi >/dev/null 2>&1; then
  echo "[!] chezmoi installation failed."
  exit 1
fi

CURRENT_SOURCE=""
if chezmoi source-path >/dev/null 2>&1; then
  CURRENT_SOURCE="$(chezmoi source-path)"
fi

if [[ "$CURRENT_SOURCE" != "$REPO_ROOT" ]]; then
  echo "[i] Initializing chezmoi source at $REPO_ROOT"
  chezmoi init
fi

echo "[i] Applying dotfiles from $REPO_ROOT"
chezmoi apply -v

echo "[i] Done."
