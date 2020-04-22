#!/bin/sh

COMMON_DOWNLOADS_DIR="$SNAP_USER_COMMON/Downloads"
COMMON_CONFIGS_DIR="$SNAP_USER_COMMON/.config/deluge"

# Make a common downloads folder if it doesn't exist
if [ -d "$COMMON_DOWNLOADS_DIR" ]; then
    echo "$COMMON_DOWNLOADS_DIR exists already! Yay!"
else
    echo "Make downloads directory: $COMMON_DOWNLOADS_DIR"
    mkdir "$COMMON_DOWNLOADS_DIR"
fi

if [ -d "$COMMON_CONFIGS_DIR" ]; then
    echo "$COMMON_CONFIGS_DIR exists already! Yay!"
else
    echo "Make config directory in common directory: $COMMON_CONFIGS_DIR"
    mkdir -p "$COMMON_CONFIGS_DIR"
fi

echo "$@" -c "$COMMON_CONFIGS_DIR/"

exec "$@" -c "$COMMON_CONFIGS_DIR/"
