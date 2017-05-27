xrdb -load ~/.Xresources &
numlockx &
unclutter --timeout 10 & 
setxkbmap -option ctrl:nocaps & 
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & 
redshift & 
compton & 
urxvtd -q -f -o & 
dunst & 
/usr/bin/dropbox & 
mpd &   
#autokey-gtk 
exec i3 
