grim -g "$(slurp -d -c '#ffffff')" - |
satty --actions-on-escape="save-to-file,exit" --initial-tool="brush" -f - -o - |
tee "$HOME/Pictures/Screenshots/Screenshot-$(date -Iseconds).png" |
wl-copy
