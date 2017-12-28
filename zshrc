# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

export TERM=xterm-256color
[ -n "$TMUX"  ] && export TERM=screen-256color

# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"
export ANDROID_HOME=$HOME/Android/Sdk
export ZSH=$HOME/.oh-my-zsh
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export PATH="$HOME/.tmux:$PATH"
export PATH=$HOME/miniconda2/bin:$PATH
export PATH="$HOME/bin/jdk1.8.0_152/bin:$PATH"
export PATH="$HOME/miniconda2/bin:$PATH"
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.cargo/bin

export HISTTIMEFORMAT="%d/%m/%y %T"
eval "$(rbenv init -)"
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# https://github.com/bhilburn/powerlevel9k
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context virtualenv anaconda dir vcs newline time)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs battery)
POWERLEVEL9K_CONTEXT_TEMPLATE="%n@`hostname -f`"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_ANACONDA_BACKGROUND='248'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='184'
POWERLEVEL9K_ANACONDA_FOREGROUND='232'
POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"


# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# TMUX config things. Please refer to https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#tmux
ZSH_TMUX_FIXTERM_WITH_256COLOR="true"
ZSH_TMUX_AUTOSTART="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract safe-paste zsh-256color zsh-nvm node npm web-search copydir copyfile cp colorize command-not-found history battery quote vi-mode battery)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias battery="sudo tlp-stat"
alias work="cd ~/Documents/Code"
alias ytd="youtube-dl -c"
alias ytdp="youtube-dl -c -o '%(playlist_index)s. %(title)s.%(ext)s'"
alias wget="wget -c"
alias vs="code"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc && source ~/.zshrc"
alias dropbox="cd $HOME/Dropbox"
alias off="sudo shutdown -h now"
alias suspend="systemctl suspend -i"
alias powerup="sudo apt update ; sudo apt upgrade"
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CFA'
alias c='clear'
alias tmux="tmux -2"
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'
alias getpwd='pwd | setclip'
alias download='aria2c -x 16 -s 16 -k 1M'
alias v='vim'
alias start_mongo='sudo service mongod start'
alias cleartex="rm *.aux *.pdf *.bbl *.blg *.dvi *.log"
alias sa="source activate"
alias sd="source deactivate"
alias conda-ls="conda info --envs"
alias tap="synclient TapButton1=1 TapButton2=3 TapButton3=2"
alias start="nautilus"

function mcd() {
    mkdir $1 && cd $1
}

function define() {
    dict $1 | less
}

function emulator() {
    AVD_NAME=Nexus_Marshmallow
    pushd ${ANDROID_HOME}/tools
    # ./emulator -avd ${AVD_NAME} $* &
    ./emulator -avd ${AVD_NAME} &
    popd
}

function touchpad() {
    synclient TouchpadOff=$1
}

bindkey -v
bindkey '^R' history-incremental-search-backward

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# add this configuration to ~/.zshrc
export HISTFILE=~/.zsh_history  # ensure history file visibility
export HH_CONFIG=hicolor        # get more colors


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

