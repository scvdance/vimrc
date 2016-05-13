export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;35;40'

export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim

alias ls='ls -GFh'
alias gs='git status'
alias gb='git branch'

# List processes listening to a TCP port: lsof -iTCP -sTCP:LISTEN
# List processes listening to a specific port: lsof -i :$PORT_NUMBER
