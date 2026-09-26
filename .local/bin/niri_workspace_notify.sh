#!/usr/bin/env bash

id_file="/tmp/niri-workspace-notify.id"

niri msg --json event-stream | while read -r line; do
    jq -e '.WorkspaceActivated' <<<"$line" >/dev/null 2>&1 || continue

    ws_id=$(jq -r '.WorkspaceActivated.id' <<<"$line")
    name=$(niri msg --json workspaces | jq -r --argjson id "$ws_id" \
        '.[] | select(.id==$id) | .name // empty')

    notify_id=$(cat "$id_file" 2>/dev/null)

    if [ -z "$name" ]; then
        [ -n "$notify_id" ] && makoctl dismiss -n "$notify_id"
        rm -f "$id_file"
    else
        notify-send -p -t 1000 ${notify_id:+-r "$notify_id"} "$name" > "$id_file"
    fi
done
