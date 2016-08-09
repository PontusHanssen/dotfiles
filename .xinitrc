[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
setxkbmap se &
pulseaudio --start &
wmname LG3D
xdg-user-dirs-update &
xrandr --dpi 90

(conky | while read LINE; do xsetroot -name "$LINE"; done) &
while true; do
    # Log stderror to a file 
    dwm 2> ~/.dwm.log
    # No error logging
    #dwm >/dev/null 2>&1
done
