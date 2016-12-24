# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then # We have color support; assume it's compliant with Ecma-48 # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CFA'
alias c='clear'
alias tp='sudo touchpad'

alias myip='nm-tool'
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

#update PC
alias powerup="sudo apt-get -y update ; sudo apt-get -y upgrade"

#edit bashrc and allow it to be used in current session
alias bashrc="vim ~/.bashrc && source ~/.bashrc"

#acads
alias acads="cd /home/matt/Documents/Acads"

#yses
alias yses="cd /home/matt/Documents/YSES"

#agsx
alias agsx="cd /home/matt/Documents/AGSX/vagrant-home/mnt"

#shutdown
alias off="sudo shutdown -h now"

#vimrc
alias vimrc="vim ~/.vimrc"

#Dropbox
alias dropbox="cd /home/matt/Dropbox"

#Homestead
alias homestead="/home/matt/Homestead"

#vscode
alias vs="code"

#wget
alias wget="wget -c"

#youtube-dl
alias ytd="youtube-dl -c"
#Change directory to higher
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias as="nohup bash /home/matt/Downloads/Android Studio/android-studio/bin/studio.sh &"
alias tmux="tmux -2"
alias SP="cd /home/matt/Dropbox/Academics/SP"

function myip() {
    /sbin/ifconfig | grep "inet 192"
    wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'
}

function ytdb() {
    youtube-dl -c --title --batch-file="$1"
}

function makepdf() {
    rm *.aux *.pdf *.bbl *.blg *.dvi *.log
    latex $1 ; bibtex $1 ; latex $1 ; pdflatex $1 ; evince $1".pdf" &
    git diff $1".tex" > "logs/"`date`".txt"
    rm *.aux *.bbl *.blg *.dvi *.log
}

alias cleartex="rm *.aux *.pdf *.bbl *.blg *.dvi *.log"

function define {
# espeak for the pronunciation audible output and phonetic alphabet string
#echo "Phoneme mnemonics: $(espeak -ven-uk-rp -x -s 120 "$1" 2> /dev/null)"       
# dict - the client for the dictionary server
    dict "$1" | less      
}
alias mysql_start="sudo service mysql start"
alias mysql_stop="sudo service mysql stop"
alias pg_start="postgres -D /usr/local/pgsql/data >logfile 2>&1 &"
alias pg_stop="pg_ctl stop"
mcd () {
    mkdir -p $1
    cd $1
}

extract() {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # mkdir $NAME && cd $NAME
        echo $1
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export NVM_DIR="/home/matt/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
alias nodeschool="cd /home/matt/Documents/Code/nodeschool"
export GOPATH=$HOME/gopath
export PATH=$GOPATH:$GOPATH/bin:$PATH

alias work="cd ~/Documents/Code"
alias 137="cd /home/matt/Documents/Code/137"
alias 142="cd /home/matt/Documents/Code/142"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

alias battery="sudo tlp-stat"
# TERM=konsole-256color
export TERM=screen-256color

function shutoff() {
    $TIME=$((1 * $1))
    echo "Shutting down in $TIME minute(s)"
}

function ext_monitor() {
    xrandr --output eDP1 --auto --output DP1 --auto --panning 1366x768+1280+0 --scale 2x2 --right-of eDP1
}
