echo -n "Workspace name: "
read NAME
if [ -z "$NAME" ]; then
  niri msg action unset-workspace-name;
else
  niri msg action set-workspace-name $NAME
fi
