# aliases - sourced by .zshrc

alias _=sudo
alias l="ls -al"
alias se="sudo -e"
alias ping="sudo nping -c 0 --delay 2s"
alias ip='ip -c'

alias readme='pandoc README.md | lynx -stdin'
alias bd='base64 -d'
alias em='emacs -nw'
alias ogh="$BROWSER -P Ambitions https://github.com/tobraha &"
alias ffa="$BROWSER -P Ambitions & "
alias ffc="$BROWSER -P Charles-IT & "
alias fft="$BROWSER -P Tommy & "

# customize zsh aliases
alias glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an %ae>%Creset'"

alias datto='ssh partner@partner-ssh.datto.com'
alias bpytop='git -C $HOME/repo/bpytop pull --rebase > /dev/null 2>&1 ; $HOME/repo/bpytop/bpytop.py'
