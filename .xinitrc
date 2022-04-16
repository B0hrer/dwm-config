#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi &

# sxhkd &
nm-applet &
xset -b & #For annoying beeping sound
start-pulseaudio-x11 &
xsetroot -cursor_name left_ptr &
nitrogen --restore &
lxpolkit &

slstatus &
xrandr --output DVI-D-0 --mode 1920x1080 --rate 144.00 --output DP-1 --mode 1920x1080 --rate 60.00 --right-of DVI-D-0 &
nvidia-settings --load-config-only &
xdotool mousemove 960 540 & #set pointer to right position

exec dwm
