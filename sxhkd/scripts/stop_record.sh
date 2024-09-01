#!/bin/bash

# Kill the ffmpeg process
pkill -x ffmpeg

notify-send -i ~/.config/sxhkd/scripts/camera.png "ffmpeg" "Recording stopped"
