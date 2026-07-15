niri msg --json event-stream | while read -r event; do
    if jq -e 'select(.WindowClosed)' >/dev/null <<<"$event"; then
        if niri msg --json workspaces | jq -e '.[] | select(.is_active and (.active_window_id | not))'; then
    		niri msg action unset-workspace-name
    	fi
    fi
done
