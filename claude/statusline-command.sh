#!/usr/bin/env bash
# Claude Code statusLine command
# Order: context usage | model | git branch | current folder

input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# p10k-style path: ~/c/cah-fulfillment
short_dir="${cwd/#\/Users\/robertbrandin/\~}"
# Abbreviate intermediate segments to first char, keep last segment full
if [[ "$short_dir" == */* ]]; then
  last="${short_dir##*/}"
  prefix="${short_dir%/*}"
  short_prefix=$(echo "$prefix" | sed 's|/\([^/]\)[^/]*|/\1|g')
  short_dir="${short_prefix}/${last}"
fi

# Git branch (skip optional locks)
git_branch=""
if git -C "$cwd" rev-parse --is-inside-work-tree -q >/dev/null 2>&1; then
  git_branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
fi

# Build the status line
parts=()

# Context window usage (green → yellow → red based on usage)
if [ -n "$used_pct" ]; then
  used_int=${used_pct%.*}
  if [ "$used_int" -ge 80 ] 2>/dev/null; then
    color='\033[31m'  # red
  elif [ "$used_int" -ge 50 ] 2>/dev/null; then
    color='\033[33m'  # yellow
  else
    color='\033[32m'  # green
  fi
  parts+=("$(printf "${color}ctx:%s%%\033[0m" "$used_int")")
fi

# Model segment (magenta)
if [ -n "$model" ]; then
  parts+=("$(printf '\033[35m%s\033[0m' "$model")")
fi

# Git branch segment (yellow)
if [ -n "$git_branch" ]; then
  parts+=("$(printf '\033[33m\uE0A0 %s\033[0m' "$git_branch")")
fi

# Directory segment (cyan)
parts+=("$(printf '\033[36m%s\033[0m' "$short_dir")")

# Join parts with separator
printf '%s' "${parts[0]}"
for part in "${parts[@]:1}"; do
  printf ' \033[2m|\033[0m %s' "$part"
done
printf '\n'
