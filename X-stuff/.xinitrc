xrdb -load ~/.Xresources &
numlockx &
feh --bg-scale /home/vsr/.wall/wall.jpg &
mpd &
compton &
/usr/bin/dropbox &
setxkbmap -option ctrl:nocaps &
#setxkbmap -option 'caps:swapescape' &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
redshift &
urxvtd -q -f -o &
unclutter --timeout 10 &
xcape -e 'Control_L=Escape' -t 175 &
dunst &
#autokey-gtk &
exec i3 
