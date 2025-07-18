# exports - sourced by .zshrc

#export BROWSER="/usr/bin/qutebrowser"
#export EDITOR="emacs"
export TZ="America/Denver"
export LOCATION="Albuquerque"

# define 'less'; only use pagination if output exceeds terminal
export LESS="-F -X $LESS"

# set monitor numbers for use with freerdp2

monitors=$(xfreerdp /monitor-list | tr "[*]" ' ')
mon1=$(echo $monitors | grep '+3840' | awk ' { print $1 } ')
mon2=$(echo $monitors | grep '+1920' | awk ' { print $1 } ')
export RDP_MONS="$mon2,$mon1"
