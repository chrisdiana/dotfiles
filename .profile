# Bash Profile

# Colors
# -----------------------------------------------------
export PS1="\[[\033[32m\]\w\[\033[m\]]\n\$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=vim
export LESSCHARSET=utf-8
export TERM=xterm-256color
export TZ=US/Eastern

# Functions
# -----------------------------------------------------
lastLoggedInUsers() {
    echo "Last logged in IPs"
    last | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' | uniq
}

search(){
    args="$@"
    query=${args// /+}
    url="https://google.com/search?q=$query"
    w3m -M -no-mouse $url
}

dict(){
    echo $* | aspell pipe
}

attachTmuxOnLogin(){
	# attach tmux on login
	if [[ "$TMUX" == "" ]] && [[ "$SSH_CONNECTION" != "" ]]; then
	    WHOAMI=$(whoami)
	    if tmux has-session -t $WHOAMI 2>/dev/null; then
	    tmux -2 attach-session -t $WHOAMI
	    else
		tmux -2 new-session -s $WHOAMI
	    fi
	fi
}

# Shortcuts
# -----------------------------------------------------
alias ll='ls -lah'
alias g=search
alias lastuser=lastLoggedInUsers
alias hs='python3 -m http.server 8080'
alias flake8='flake8 --format "%(row)d:%(col)d: %(code)s %(text)s" --max-line-length 120'
alias sqlite3='sqlite3 -header -column'
alias dict=dict
