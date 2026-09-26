#!/usr/bin/env bash

output=$(~/.cargo/bin/tomat status -o waybar -f " {time} " 2>/dev/null)

# Pull out the class field; hide unless it's one of the known active phases
class=$(echo "$output" | grep -oP '"class":\s*"\K[^"]+')

case "$class" in
  work|work-paused|break|break-paused|long-break|long-break-paused)
    echo "$output"
    ;;
  *)
    echo '{"text": "", "class": "hidden"}'
    ;;
esac
