# This shell script is run before Openbox launches.
# Environment variables set here are passed to the Openbox session.

xcompmgr &
tint2 &

{
  while true; do
    wprotate
    sleep 20m
  done
} &

## Volume control for systray
(sleep 2s && pnmixer) &

## Detect and configure touchpad. See 'man synclient' for more info.
if egrep -iq 'touchpad' /proc/bus/input/devices; then
    synclient VertEdgeScroll=1 &
    synclient TapButton1=1 &
fi

## Set keyboard settings - 250 ms delay and 25 cps (characters per second) repeat rate.
## Adjust the values according to your preferances.
xset r rate 250 25 &

## Turn on/off system beep
xset b off &
