# Chris' Bash RC

# Shortcuts
# -----------------------------------------------------

alias ll='ls -lah'
alias ls='ls -Fa'

# Colors
# -----------------------------------------------------
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch)\[\033[00m\]\$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
TERM=xterm-256color
export EDITOR=vim


# Utilities
# -----------------------------------------------------
# Load local .bashrc if it exists
test -f ~/.bashrc-local && source ~/.bashrc-local

