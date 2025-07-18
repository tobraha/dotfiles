# aliases - sourced by .zshrc

alias _=sudo
alias l="ls -al"
alias se="sudo -e"
alias ping="sudo nping -c 0 --delay 2s"
alias ip='ip -c'
alias dc='docker-compose'
alias zf='zathura --fork'

alias readme='pandoc README.md | lynx -stdin'
alias bd='base64 -d'
alias hd='hexdump -C'
alias em='emacs -nw'
alias vim='nvim'
alias clip='xclip -selection c'
alias ogh="$BROWSER -P Ambitions https://github.com/tobraha &"
alias ffa="$BROWSER -P Ambitions & "
alias ffc="$BROWSER -P Charles-IT & "
alias fft="$BROWSER -P Tommy & "

# customize zsh aliases
alias glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad)%Creset %C(auto,blue)[%G?:%GF]%Creset %C(bold blue)<%an>%Creset'"

alias datto='ssh partner@partner-ssh.datto.com'
alias bpytop='git -C $HOME/repo/bpytop pull --rebase > /dev/null 2>&1 ; $HOME/repo/bpytop/bpytop.py'
alias weather='curl wttr.in; printf "\n\n -Press ENTER for v2 details-\n\n"; read; curl v2.wttr.in'
