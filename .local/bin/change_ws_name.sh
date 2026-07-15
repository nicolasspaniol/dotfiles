echo -ne "\n  Workspace name: "
read -r NAME
if [[ -z "$NAME" ]]; then
    niri msg action unset-workspace-name;
else
    niri msg action set-workspace-name $(echo "$NAME" | tr " " _)
fi
