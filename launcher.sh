#!/bin/sh

if [ -d "$SNAP_USER_DATA/.config/deluge" ]; then
    echo "$SNAP_USER_DATA exists"
else
    mkdir -p "$SNAP_USER_DATA/.config/deluge/"
fi

exec "$@"
