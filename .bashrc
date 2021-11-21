
##-----------------------------------------------------
## synth-shell-prompt.sh
if [ -f /home/dhiraj/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/dhiraj/.config/synth-shell/synth-shell-prompt.sh
fi
alias sst="shutdown 00"
alias la='ls -a'
alias ssr="shutdown -r 00"
alias gs='git status'
alias z='zsh'
alias glog='git log --graph --decorate --oneline'
#neofetch

alias cc="clear"
alias zz='exit'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
## this is dheeraj
