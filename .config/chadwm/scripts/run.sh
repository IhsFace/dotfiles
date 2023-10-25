#!/bin/sh

dbus-update-activation-environment --all
gnome-keyring-daemon --start --components=secrets
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

if xrandr | grep "HDMI-1-0 connected" > /dev/null; then
	xrandr --output HDMI-1-0 --auto --output eDP-1 --off
	sed -i 's/st.font:.*/st.font:	JetBrainsMono Nerd Font:style:medium:pixelsize=13/g' ~/.Xresources
else
	xrandr --output eDP-1 --auto --dpi 192
	sed -i 's/st.font:.*/st.font:	JetBrainsMono Nerd Font:style:medium:pixelsize=26/g' ~/.Xresources
fi

xrdb merge ~/.Xresources 
xbacklight -set 10 &
feh --bg-fill ~/Pictures/wall/leaves-wall.png &
xset r rate 200 50 &
picom &
/usr/lib/polkit-kde-authentication-agent-1 &
dunst &
volnoti &
nm-applet &
blueman-applet &

~/.config/chadwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
