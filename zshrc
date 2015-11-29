export EDITOR="vim"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gnzh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
plugins=(git zsh-syntax-highlighting)

# User configuration

#export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/brianmcelhany/Dev/Apache/apache-maven-3.2.3/bin:/usr/local/mysql/bin:/Library/Cake/Console"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/Dev/Apache/apache-maven-3.2.3/bin:/usr/local/mysql/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Enable todo.txt auto-completion
source /usr/local/Cellar/todo-txt/2.10/etc/bash_completion.d/todo_completion

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# SET PATH INFO
export M2_HOME=$HOME/Dev/Apache/apache-maven-3.2.3
export M2=$M2_HOME/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home
export ANT_HOME=$HOME/Dev/Apache/apache-ant/bin
export MYSQL_HOME=/usr/local/mysql/bin
export VIMRUNTIME=/usr/share/vim/vim73
export PATH=$PATH:$M2:$MYSQL_HOME

# ENABLE NICE COLORS IN THE TERMINAL
export CLICOLOR=1
export TERM=xterm-256color

# ALIASES
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias mysqlstart='sudo /usr/local/mysql/support-files/mysql.server start'
alias mysqlstop='sudo /usr/local/mysql/support-files/mysql.server stop'
alias tomcatstart='/Library/Tomcat/bin/startup.sh'
alias tomcatstop='/Library/Tomcat/bin/shutdown.sh'
alias zookeeperstart='/usr/local/Cellar/zookeeper/3.4.6_1/bin/zkServer start'
alias zookeeperstop='/usr/local/Cellar/zookeeper/3.4.6_1/bin/zkServer stop'
alias ls='ls -GFlash'
alias dw='cd ~/Dev/WorkSpaces'
alias dn='cd ~/Documents/Notebook'
alias t='todo.sh -d ~/.todo.cfg'

# Show dirty state in prompt when in Git repos
export GIT_PS1_SHOWDIRTYSTATE=1

# CTRL-Z will "minimize" VIM. Instead of typing fg<ENTER> to
# bring it back to the foreground, just hit CTRL-Z again
fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER="fg"
         zle accept-line
    else
         zle push-input
         zle clear-screen
    fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
