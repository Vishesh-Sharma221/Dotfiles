#! /bin/sh

# Terminate all running polybar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
polybar top &

if [[ $(xrandr -q | grep 'HDMI1 connected') ]]; then
	polybar top_external &
fi
