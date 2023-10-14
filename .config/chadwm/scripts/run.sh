#!/bin/sh

dbus-update-activation-environment --all
gnome-keyring-daemon --start --components=secrets
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
xrdb merge ~/.Xresources 
xbacklight -set 10 &
feh --bg-fill ~/Pictures/wall/leaves-wall.png &
xset r rate 200 50 &
picom &
pasystray &
nm-applet &
blueman-applet &

~/.config/chadwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
