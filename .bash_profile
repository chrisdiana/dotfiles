# Chris' Bash RC

# Shortcuts
# -----------------------------------------------------

alias ll='ls -lah'
alias ls='ls -Fa'

# Colors
# -----------------------------------------------------
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$\n"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=vim

TERM=xterm-256color


# Utilities
# -----------------------------------------------------
# Load local .bashrc if it exists
test -f ~/.bashrc-local && source ~/.bashrc-local

export PATH=~/.local/bin:$PATH
