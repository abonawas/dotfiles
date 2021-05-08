# User specific environment and startup programs
if [ "$(uname 2> /dev/null)" = "Linux" ]; then
    if [ -f ./etc/profile ]; then
	    . ./etc/profile
    fi
fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export EDITOR=nvim
export MANPAGER="/bin/sh -c \"col -b | nvim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

alias k="kubectl"
alias ka="kubectl apply -f"
alias kg="kubectl get"
alias kga="kubectl get all"
alias kd="kubectl describe"

alias v="nvim"
alias zrc="nvim ~/dotfiles/zshrc"
alias vrc="nvim ~/dotfiles/config/nvim/init.vim"
alias trc="nvim ~/dotfiles/tmux.conf"


bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTSIZE=999999999
export SAVEHIST=999999999

if [ "$(uname 2> /dev/null)" = "Linux" ]; then
    export HISTFILE=~/.bash_eternal_history

    alias cdd="cd /dls/science/users/ovs72384/"
    alias stow=$HOME/local/stow/bin/stow
    alias code=$HOME/Applications/code/bin/code

    # make CapsLock behave like Ctrl:
    setxkbmap -option ctrl:nocaps

    # make short-pressed Ctrl behave like Escape:
    $HOME/Applications/xcape/xcape -e 'Control_L=Escape'

    # Clean remake builder IOCs
    function cleanMake {
	if [ $# -ge 1 ]; then
	    for IOC in "$@"
	    do
		    XMLFILE=etc/makeIocs/$IOC.xml
		    if [ -f "$XMLFILE" ]; then
			    rm -rf iocs/$IOC
			    touch $XMLFILE
			    make -C etc/makeIocs IOCS=$IOC
			    make -C iocs/$IOC
		    else
			    echo "$XMLFILE does not exist for IOC $IOC."
		    fi
	    done
	else
	    echo "Requires IOC(s) (at least 1 argument)"
	fi
    }

fi

if [ "$(uname 2> /dev/null)" = "Darwin" ]; then
    # https://www.kevinhooke.com/2017/10/05/switching-java-versions-on-mac-os/
    alias j14="export JAVA_HOME=`/usr/libexec/java_home -v 14`"
    alias j11="export JAVA_HOME=`/usr/libexec/java_home -v 11`"
    alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8`"
    export PATH="~/Library/Haskell/bin/:$PATH"
    # export PATH=~/anaconda/bin:"$PATH"
fi


#################
# oh-my-zsh stuff
#################

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
if [ "$(uname 2> /dev/null)" = "Darwin" ]; then
    ZSH_THEME="robbyrussell"
fi
if [ "$(uname 2> /dev/null)" = "Linux" ]; then
    ZSH_THEME="aussiegeek"
fi

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux docker)

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
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

fpath+=${ZDOTDIR:-~}/.zsh_functions
