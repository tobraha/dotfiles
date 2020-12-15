# aliases - sourced by .zshrc

* alias _=sudo
* alias l="ls -al"
* alias se="sudo -e"
* alias readme='pandoc README.md | lynx -stdin'
* alias bd='base64 -d'
* alias em='emacs -nw'

* alias ogh="$BROWSER https://github.com/tobraha"
* alias datto='ssh partner@partner-ssh.datto.com'

* alias bpytop='git -C $HOME/repo/bpytop pull --rebase > /dev/null 2>&1 ; $HOME/repo/bpytop/bpytop.py'
* alias rdp='screen -S win10-vm-rdp xfreerdp /floatbar:sticky:on,default:hidden,show:fullscreen /multimon /u:tommy /audio-mode:0 /sound:sys:alsa,format:1,quality:high +aero +window-drag +fonts +menu-anims /v:172.20.1.147'
* alias connector='sagent; screen -dmS rdp-connector ssh -oServerAliveInterval=180 -NvR 3391:172.20.1.147:3389 pivot@172.16.100.30'
