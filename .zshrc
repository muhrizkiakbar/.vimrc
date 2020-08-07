export TERM="xterm-256color"

#; Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Run spectrum_ls to see a list of colors zsh can easily produce and
# which can be used in a theme
#ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-Arma virumque cano Troiae qui primus ab oris}

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
ZSH_THEME="powerlevel9k/powerlevel9k"
DEFAULT_USER=`whoami`

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
unsetopt correct_all

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration


export EDITOR='vim'

# Load private keys
#source ~/dotfiles/secret-keys.sh

# Load aliases
#source ~/dotfiles/aliases.sh

# Load in fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use ripgrep to get list of files over find, search hidden files, follow symlinks
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!{.git,package-lock.json}"'

# Type "fd" to open a directory using fzf
fd() {
	local dir
	dir=$(find ${1:-.} -path '*/\.*' -prune \
		-o -type d -print 2> /dev/null | fzf +m) &&
		cd "$dir"
}


# Type "fo" to open a file in its default application by hiting ctrl + o when
# the file is selected
fo() {
	x=$(preview)
	folder_path=$(echo $x | cut -d '.' -f 1,1 | rev | cut -d "/" -f2- | rev);
	cd $folder_path
	nvim $(echo $x | rev | cut -d '/' -f 1,1 | rev)
}


# Helper function to remove/putback work npmrc file
npmrc() {
    if [[ -f ~/.npmrc ]]; then
        mv ~/.npmrc ~/temp.npmrc
		echo "temp.npmrc"
    elif [[ -f ~/temp.npmrc ]]; then
        mv ~/temp.npmrc ~/.npmrc
		echo ".npmrc"
    fi

}

#####################################################################################
### Powerlevel 9k Settings - https://github.com/bhilburn/powerlevel9k - NOTE: I'm using powerlevel10k
#####################################################################################

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"
POWERLEVEL9K_RVM_BACKGROUND="black"
POWERLEVEL9K_RVM_FOREGROUND="249"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_RVM_BACKGROUND="black"
POWERLEVEL9K_RVM_FOREGROUND="249"
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="249"
POWERLEVEL9K_TIME_FORMAT="\UF43A %D{%I:%M  \UF133  %m.%d.%y}"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='white'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_COMMIT_ICON="\uf417"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='blue'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%f "
POWERLEVEL9K_CUSTOM_DOCKER_SIGNAL="zsh_docker_signal"
POWERLEVEL9K_CUSTOM_INTERNET_SIGNAL="zsh_internet_signal"
POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_BATTERY_ICON='\uf1e6'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir battery context vcs root_indicator dir_writable)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(node_version status background_jobs host user)
HIST_STAMPS="mm/dd/yyyy"
DISABLE_UPDATE_PROMPT=true

#################################################
### Colorize Man pages
#################################################

export MANROFFOPT='-c'
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
#export PATH="$HOME/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/bin:/usr/local/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

unset DOCKER_TLS_VERIFY
unset DOCKER_CERT_PATH
unset DOCKER_MACHINE_NAME
unset DOCKER_HOST


source $ZSH/oh-my-zsh.sh

plugins=(git tmux)

alias dostart="service docker start"
alias dostop="service docker stop"
alias doexwebbash="docker-compose exec web bash"
alias doexworkbash="docker-compose exec workspace bash"
alias doup="docker-compose up -d"
alias portainer="cd /Users/diskominfo/Project/portrainer/ && docker-compose up -d"
alias rails_dev="cd /Users/diskominfo/Project/rails_dev/ && docker-compose run --rm --service-ports rails_dev"
alias deno_dev="cd /Users/diskominfo/Project/deno/ && docker-compose run --service-ports --rm deno"
alias postgre="cd /Users/diskominfo/Project/postgres && docker-compose up -d"
alias mysql="cd /Users/diskominfo/Project/mongo && docker-compose up -d"
#alias solar ="cd /Users/diskominfo/Project/rails_dev/ && docker-compose run --rm --service-ports solar" 

alias gpom="git push origin master"
alias gpull="git pull"
alias gfetch="git fetch"

alias editalias="vim ~/.zshrc"

if [ "$TMUX" = "" ]; then tmux; fi
