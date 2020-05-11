#!/bin/sh

DAEMON=false

# -d is optional, doesn't need an argument
# -c is not optional, required an argument
while getopts :dc: option
do
    case "${option}"
    in
        d) DAEMON=true;;
        c) COMMAND=${OPTARG};;
    esac
done

if [ $DAEMON = true ]; then
    echo "Run as daemon"
    COMMON_DOWNLOADS_DIR="$SNAP_COMMON/Downloads"
    COMMON_CONFIGS_DIR="$SNAP_COMMON/.config/deluge"
else
    echo "Run as user"
    COMMON_DOWNLOADS_DIR="$SNAP_USER_COMMON/Downloads"
    COMMON_CONFIGS_DIR="$SNAP_USER_COMMON/.config/deluge"
fi

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

echo "$COMMAND" -c "$COMMON_CONFIGS_DIR/"

exec "$COMMAND" -c "$COMMON_CONFIGS_DIR/"
