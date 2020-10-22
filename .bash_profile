# Chris' Bash RC

# Shortcuts
# -----------------------------------------------------
alias ll='ls -lah'

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

# Utilities
# -----------------------------------------------------
alias t='vi -c "set nonumber" ~/todo.txt'
