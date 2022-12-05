USERXSESSION="$XDG_CACHE_HOME/X11/xsession"
USERXSESSIONRC="$XDG_CAHCE_HOME/X11/xsessionrc"
ALTUSERXSESSION="$XDG_CACHE_HOME/X11/Xsession"
ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"

setxkbmap -layout us,ru
setxkbmap -option 'grp:win_space_toggle'
xset s off
xset -dpms
xset s noblank
xset r rate 210 40

# see https://unix.stackexchange.com/a/295652/332452
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# see https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# see https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
mkdir -p "$HOME"/.local/share/keyrings

exec i3
