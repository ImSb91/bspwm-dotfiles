#!/bin/bash

# Define the output file with the current date and time
output_file="$HOME/Videos/$(date '+%Y-%m-%d_%H-%M-%S').mp4"

# Check if a recording is already running
if pgrep -x "ffmpeg" > /dev/null; then
    echo "Recording is already in progress."
    exit 1
fi

# Start recording using ffmpeg

ffmpeg -video_size 1600x900 -framerate 60 -f x11grab -i :0.0 -f pulse -i bluez_output.62_A2_CF_10_65_E2.1.monitor -c:v h264_nvenc -preset fast -b:v 5M -maxrate 5M -bufsize 10M "$HOME/Videos/$(date '+%Y-%m-%d_%H-%M-%S').mp4" &
notify-send -i ~/.config/sxhkd/scripts/camera.png "ffmpeg" "Recording started"
