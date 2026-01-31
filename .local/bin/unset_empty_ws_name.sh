niri msg --json event-stream | while read -r event; do
    if jq -e 'select(.WindowFocusChanged and .WindowFocusChanged.id == null)' >/dev/null <<< "$event"; then
        niri msg action unset-workspace-name
    fi
done
