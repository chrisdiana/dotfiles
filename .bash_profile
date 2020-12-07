# Bash Profile

# Shortcuts
# -----------------------------------------------------
alias ll='ls -lah'
alias t='vi -c "set nonumber" "$PM_PATH"/todo.txt'
alias ts='git -C $PM_PATH add . ; git -C $PM_PATH commit -am "updates"; git -C $PM_PATH push;'
alias tg='git -C $PM_PATH pull;'

# Colors
# -----------------------------------------------------
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\n\$ "
export PS1="\[[\033[32m\]\w\[\033[m\]]\n\$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=vim
export LESSCHARSET=utf-8
export TERM=xterm-256color

# Load local .bashrc if it exists
test -f ~/.bashrc_local && source ~/.bashrc_local

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
    w3m $url
}

alias g=search
alias lastuser=lastLoggedInUsers
