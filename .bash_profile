# Bash Profile

# Shortcuts
# -----------------------------------------------------
alias ll='ls -lah'

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

checkGmail() {
    # checkGmail "username" "password"
    username=$1
    password=$2
    while true
    do
        curl -u "$username:$password" "$@" --silent "https://mail.google.com/mail/feed/atom" \
            | awk -F '<entry>' '{for (i=2; i<=NF; i++) {print $i}}' \
            | sed -n "s/<title>\(.*\)<\/title.*summary>\(.*\)<\/summary.*issued>\(.*\)<\/issued.*name>\(.*\)<\/name.*email>\(.*\)<\/email>.*/ \n » \1 - \4\ [\5\] \n\n \2 \n\n ---------------------------/p" \
            | less && echo "Reloading..." && sleep 2
    done
}

sendEmail() {
    # sendEmail "myemail@gmail.com" "someone@gmail.com" file.txt
    from=$1
    to=$2
    file=$3
    curl -n --ssl-reqd --mail-from "$from" --mail-rcpt "$to" --url smtps://smtp.gmail.com:465 -T $3
}

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

editTodo(){
    # alias todo='editTodo <gist-id>
    gist_id=$1
    todo_file="todo.txt"
    gh gist edit $gist_id -f $todo_file
}

alias g=search
alias lastuser=lastLoggedInUsers
alias hs='python -m SimpleHTTPServer 8080'
alias todo=editTodo
alias flake8='flake8 --format %(row)d:%(col)d: %(code)s %(text)s --max-line-length 120'

# For Debian/Ubuntu
function pretty_csv {
    column -t -s, -n "$@" | less -F -S -X -K
}
function pretty_tsv {
    column -t -s $'\t' -n "$@" | less -F -S -X -K
}
# For non-Debian systems
function pretty_csv {
    # cat file.csv | sed -e 's/,,/, ,/g' | column -s, -t | less -#5 -N -S
    perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K
}
function pretty_tsv {
    perl -pe 's/((?<=\t)|(?<=^))\t/ \t/g;' "$@" | column -t -s $'\t' | less  -F -S -X -K
}

# attach tmux on login
if [[ "$TMUX" == "" ]] && [[ "$SSH_CONNECTION" != "" ]]; then
    WHOAMI=$(whoami)
    if tmux has-session -t $WHOAMI 2>/dev/null; then
    tmux -2 attach-session -t $WHOAMI
    else
        tmux -2 new-session -s $WHOAMI
    fi
fi

#Load local .bashrc if it exists
if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi


