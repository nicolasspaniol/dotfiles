prev_is_close=0

niri msg --json event-stream | while read -r event; do
    if jq -e 'select(.WindowClosed)' >/dev/null <<<"$event"; then
        prev_is_close=1
        continue
    fi

    if jq -e 'select(.WindowFocusChanged and .WindowFocusChanged.id == null)' >/dev/null <<<"$event"; then
        if [[ $prev_is_close -eq 1 ]]; then
            niri msg action unset-workspace-name
        fi
    fi

    prev_is_close=0
done
