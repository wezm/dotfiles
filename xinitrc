#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# Load system config if present
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Set DPI so that things render in HiDPI properly
xrandr --dpi 192

# This is done by /etc/X11/xinit/xinitrc.d/50-systemd-user.sh on Arch:
# dbus-update-activation-environment --systemd DISPLAY 

# Make gnome-keyring play nice
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Configure track pad on the fly
# xinput set-prop 16 294 1         # Natural scrolling
# xinput set-prop 16 302 '{0' '1}' # Use 2 or 3 fingers for right and middle click
# xinput set-prop 16 306 0.5       # Increase acceleration

# Configure mouse on the fly
# xinput set-button-map 7 1 2 3 5 4

# Arch Linux
# These are set via /etc/X11/xorg.conf.d/30-touchpad.conf
# Section "InputClass"
#     Identifier "TouchPad"
#     Driver "libinput"
#     MatchIsTouchpad "on"
#     Option "ClickMethod" "clickfinger"
#     Option "NaturalScrolling" "true"
#     Option "AccelSpeed" "0.5"
# EndSection

# FreeBSD
# /usr/local/etc/X11/xorg.conf.d/30-mouse.conf
# http://onethingwell.org/post/8779215052/reverse-scrolling-x11
# Section "InputClass"
#     Identifier "Mouse"
#     MatchDriver "mouse"
#     Option "ZAxisMapping" "5 4"
# EndSection

# Start compositor and WM
compton &
awesome
