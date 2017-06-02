if status --is-login
   if test -z "$DISPLAY" -a $XDG_VTNR = 1
	exec startx -- -keeptty >~/.xorg.log ^&1
   end
end

alias .="./a.out < stdin"
alias v="vim"
alias gg="ping www.google.co.in"
alias nf="neofetch"
alias fls="ranger /mnt"
alias s="sudo"
alias ..="cd .."
alias upate="sudo pacaur -Syu"
alias cm="cmatrix"
alias ncp="ncmpcpp"
alias pk="pkill"
alias spk="sudo pkill"
alias clr="clear"
alias q="exit"
alias fl="ranger"
alias ge="gedit"
alias poff="poweroff"
alias rbt="reboot"
alias pm="pacman"
alias pa="pacaur"
alias nv="nvim"
