#!/usr/bin/env bash
declare -A status
while IFS= read -r line; do
  status["${line:3}"]="${line:0:2}"
done < <(git status --porcelain)

tree --gitignore -f | while IFS= read -r line; do
  # skip blank lines and the trailing summary line
  [[ -z "$line" || "$line" =~ ^[0-9]+\ directories ]] && { echo "$line"; continue; }

  path="${line##*── }"
  path="${path#./}"

  code="${status[$path]:-}"
  case "$code" in
    "??") echo -e "\e[32m${line}\e[0m" ;;
    " M"|"M "|"MM") echo -e "\e[33m${line}\e[0m" ;;
    " D"|"D ") echo -e "\e[31m${line}\e[0m" ;;
    *) echo "$line" ;;
  esac
done

# list deleted files separately, since tree can't show missing paths
deleted=$(git status --porcelain | grep '^ D\|^D ' | cut -c4-)
if [[ -n "$deleted" ]]; then
  echo ""
  echo "Deleted:"
  while IFS= read -r f; do
    echo -e "\e[31m  $f\e[0m"
  done <<< "$deleted"
fi
