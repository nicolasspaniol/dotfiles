while true; do
    file=$(xplr --read-only)

    if [ -d "$file" ]; then
        cd "$file"
    else
        :e "$file"
    fi
done
