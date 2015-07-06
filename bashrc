# SET PATH INFO
export M2_HOME=/Users/brianmcelhany/Dev/Apache/apache-maven-3.2.3
export M2=$M2_HOME/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home
export ANT_HOME=/Users/brianmcelhany/Dev/Apache/apache-ant/bin
export MYSQL_HOME=/usr/local/mysql/bin
export VIMRUNTIME=/usr/share/vim/vim73
export CAKE_HOME=/Library/Cake/Console
export PATH=$PATH:$M2:$MYSQL_HOME:$CAKE_HOME

# ENABLE NICE COLORS IN THE TERMINAL
export CLICOLOR=1
export TERM=xterm-256color
export PS1="\[\033[1;34m\]\h\[\033[0m\] :\[\033[1;35m\]\W\[\033[0m\]$ "

# ALIASES
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias mysqlstart='sudo /usr/local/mysql/support-files/mysql.server start'
alias mysqlstop='sudo /usr/local/mysql/support-files/mysql.server stop'
alias tomcatstart='/Library/Tomcat/bin/startup.sh'
alias tomcatstop='/Library/Tomcat/bin/shutdown.sh'
alias ls='ls -GFlash'
alias dw='cd ~/Dev/WorkSpaces'
alias dn='cd ~/Documents/Notebook'
alias t='todo.sh'

# Show dirty state in prompt when in Git repos
export GIT_PS1_SHOWDIRTYSTATE=1
