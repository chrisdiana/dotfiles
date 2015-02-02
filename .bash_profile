export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
DATE=`date +%Y-%m-%d`
# export PATH="$(brew --prefix homebrew/php/php54)/bin:$PATH"
alias note='vi ~/Google\ Drive/Work/notes.md'
alias editbash='sudo vi ~/dotfiles/.bash_profile'
alias editvimrc='vi ~/.dotfiles/.vimrc'

# MAMP
# -----------------------------------------------------
alias phpmamp='/Applications/MAMP/bin/php/php5.2.17/bin/php'
alias mamp='cd /Applications/MAMP/htdocs'
alias mphplog='tail -f /Applications/MAMP/logs/php_error.log'
alias mapachelog='tail -f /Applications/MAMP/logs/apache_error.log'
alias mmysqllog='tail -f /Applications/MAMP/logs/mysql_error.log'
alias editmphplog='sudo vi /Applications/MAMP/logs/php_error.log'


# Blog
# -----------------------------------------------------
newJekyllPost() {
	cp ~/Sites/cdmedia.github.io/_posts/2014-01-01-post-template.md ~/Sites/cdmedia.github.io/_posts/$DATE-$1.md
	vi ~/Sites/cdmedia.github.io/_posts/$DATE-$1.md
}
alias newpost=newJekyllPost
alias editpost='vi ~/Sites/cdmedia.github.io/_posts'
alias editlinks='vi ~/Sites/cdmedia.github.io/links.md'
alias blog='cd ~/Sites/cdmedia.github.io/'
alias blogcommit='git commit -a -m "blog updates"'

# Utilities
# -----------------------------------------------------
alias ll="ls -la"
# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# Make ls use colors
export CLICOLOR=1
alias ls='ls -Fa'

# define colors
C_DEFAULT="\[\033[m\]"
C_WHITE="\[\033[1m\]"
C_BLACK="\[\033[30m\]"
C_RED="\[\033[31m\]"
C_GREEN="\[\033[32m\]"
C_YELLOW="\[\033[33m\]"
C_BLUE="\[\033[34m\]"
C_PURPLE="\[\033[35m\]"
C_CYAN="\[\033[36m\]"
C_LIGHTGRAY="\[\033[37m\]"
C_DARKGRAY="\[\033[1;30m\]"
C_LIGHTRED="\[\033[1;31m\]"
C_LIGHTGREEN="\[\033[1;32m\]"
C_LIGHTYELLOW="\[\033[1;33m\]"
C_LIGHTBLUE="\[\033[1;34m\]"
C_LIGHTPURPLE="\[\033[1;35m\]"
C_LIGHTCYAN="\[\033[1;36m\]"
C_BG_BLACK="\[\033[40m\]"
C_BG_RED="\[\033[41m\]"
C_BG_GREEN="\[\033[42m\]"
C_BG_YELLOW="\[\033[43m\]"
C_BG_BLUE="\[\033[44m\]"
C_BG_PURPLE="\[\033[45m\]"
C_BG_CYAN="\[\033[46m\]"
C_BG_LIGHTGRAY="\[\033[47m\]"

export PS1="\n$C_LIGHTGREEN\u$C_DARKGRAY@$C_BLUE\h $C_DARKGRAY: $C_LIGHTYELLOW\w\n$C_DARKGRAY\$$C_DEFAULT "

TERM=xterm-256color

# added by Anaconda 2.1.0 installer
export PATH="//anaconda/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
