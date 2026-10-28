#!/usr/bin/env bash

# Keep Git's two-character status by path. Listing untracked files individually
# lets both files and their parent directories be matched against the tree.
declare -A status
while IFS= read -r line; do
  status["${line:3}"]="${line:0:2}"
done < <(git status --porcelain --untracked-files=all)

# -f gives each entry a usable path for status lookup; below, only its basename
# is printed so the display stays like ordinary `tree` output.
tree --gitignore -f | while IFS= read -r line; do
  # Pass through tree's blank line and final file/directory count unchanged.
  [[ -z "$line" || "$line" =~ ^[0-9]+\ directories ]] && { echo "$line"; continue; }

  path="${line#*── ./}"
  name="${path##*/}"
  prefix="${line%./$path}"
  display="$prefix$name"
  code="${status[$path]:-}"
  if [[ -z "$code" ]]; then
    # Directories have no Git status of their own. Reflect a uniform descendant
    # status, but leave the directory uncolored if its contents are mixed.
    for child in "${!status[@]}"; do
      [[ "$child" == "$path/"* ]] || continue
      if [[ -z "$code" ]]; then
        code="${status[$child]}"
      elif [[ "$code" != "${status[$child]}" ]]; then
        code=MIXED
        break
      fi
    done
  fi
  # Green = untracked, yellow = modified, red = deleted; other states stay plain.
  case "$code" in
    "??") color=32 ;;
    " M"|"M "|"MM") color=33 ;;
    " D"|"D ") color=31 ;;
    *) echo "$display"; continue ;;
  esac
  printf '%s\033[%sm%s\033[0m\n' "$prefix" "$color" "$name"
done

# Deleted paths are absent from `tree`, so show them in a separate section.
deleted=$(git status --porcelain | awk 'substr($0,1,2) ~ /D/ {print substr($0,4)}')
if [[ -n "$deleted" ]]; then
  echo
  echo 'Deleted:'
  while IFS= read -r file; do printf '\033[31m  %s\033[0m\n' "$file"; done <<< "$deleted"
fi
