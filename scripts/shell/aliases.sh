# aliases - sourced by .zshrc

alias _=sudo
alias l="ls -al"
alias se="sudo -e"

alias readme='pandoc README.md | lynx -stdin'
alias bd='base64 -d'
alias em='emacs -nw'
alias ogh="$BROWSER -P Ambitions https://github.com/tobraha &"
alias ffa="$BROWSER -P Ambitions & "
alias ffc="$BROWSER -P Charles-IT & "
alias fft="$BROWSER -P Tommy & "

alias datto='ssh partner@partner-ssh.datto.com'
alias bpytop='git -C $HOME/repo/bpytop pull --rebase > /dev/null 2>&1 ; $HOME/repo/bpytop/bpytop.py'
