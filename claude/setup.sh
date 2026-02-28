#!/bin/bash
# Symlink Claude config files from dotfiles repo into ~/.claude
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

mkdir -p "$CLAUDE_DIR"

link() {
  local src="$DOTFILES_DIR/$1"
  local dest="$CLAUDE_DIR/$2"

  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "Backing up existing $dest to ${dest}.bak"
    mv "$dest" "${dest}.bak"
  fi

  ln -sf "$src" "$dest"
  echo "Linked $dest -> $src"
}

link "CLAUDE.md"     "CLAUDE.md"
link "settings.json" "settings.json"
link "mcp.json"      ".mcp.json"
link "skills"        "skills"
link "statusline-command.sh" "statusline-command.sh"

echo "Done."
