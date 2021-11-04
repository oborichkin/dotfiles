setxkbmap -layout us,ru
setxkbmap -option 'grp:win_space_toggle'
xset s off
xset -dpms
xset s noblank
xset r rate 210 40
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
exec i3
