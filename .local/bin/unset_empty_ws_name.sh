# TODO: verify if the workspace is really empty before unsetting instead of
# doing the overview thing; taking a screenshot removes the name for now
niri msg --json event-stream | while read -r event; do
    if jq -e 'select(.WindowFocusChanged and .WindowFocusChanged.id == null)' >/dev/null <<<"$event"; then
        if niri msg -j overview-state | jq -e '.is_open == false' >/dev/null; then
            niri msg action unset-workspace-name
        fi
    fi
done
