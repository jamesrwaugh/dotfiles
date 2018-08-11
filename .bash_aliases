# My Aliases to make life easier
alias sudo='sudo ' #http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias ga='git add'
alias gaa='git add --all'
alias gc='git checkout'
alias gm='git merge'
alias gch='git checkout HEAD'
alias gcm='git commit -m'
alias gd='git diff'
alias gl='git log'
alias gr='git reset'
alias grh='git reset HEAD'
alias gs='git status'
alias gb='git branch'
alias gu='git reset --soft HEAD~1'
alias gplb='git pull origin'
alias gpb='git push origin'
alias gp='git pull'
alias h='history'
alias c='clear'
alias l='ls -CF'
alias ll='ls -la --human-readable'
alias df='df --human-readable'
alias cg='clear && gs'
alias logisim='java -jar ~/Downloads/logisim-generic-2.7.1.jar'
alias refbox='pushd ~/ssl-refbox/ && ./sslrefbox && popd'
export MY_SIM_ADDRESS='131.247.14.106'
export QT_SIM_CLIENT='~/grSim/bin/client'
export PS1="\[$(tput bold)\]\[$(tput setaf 6)\]\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ \[$(tput sgr0)\]"

function jpg95() {
    convert "$1" -quality 95% "$(echo $1 | cut -d "." -f 1).jpg"
}

#Looks for a lib in /usr/lib and /usr/local/lib
function findlib() {
	find /usr/{local/,}lib \( -iname "*$1*\.a" -o -iname "*$1*\.so" \)
}

#Looks for headers in /usr/include and /usr/local/include
function findinc() {
	find /usr/{local/,}include -iname "*$1*"
}

#Better du
function du() {
    `which du` ${1-.} --human-readable | sort --human-numeric-sort
}

#Search history for something, or display tail with no arguments
function hs() {
    if [ -n "$1" ]; then
        history | grep $1
    else
        history | tail
    fi
}

#Execute the command at the "$1"th history line, as shown by the command.
#The command at that line is brought back up in history
function hse() {
    line=$(history | egrep "^\W?$1")
    if [ -n "$line" ]; then
        command=$(echo $line | sed "s/[[:digit:]]* //")
        eval $command
        history -s $command #Record this command in history
    else 
        echo "No History Line $1"
    fi
}

#Search for something in ps or just display "au"
function pss() {
    if [ -n "$1" ]; then
        ps aux | grep $1
    else
        ps au
    fi
}

#set /usr/local/lib and . as library path
function lld() {
	export LD_LIBRARY_PATH='/usr/local/lib:.'
}

# "Git clone branch"
function gclb() {
	git checkout -b $1 origin/$1
}
    
#Save a dated tar.gz of the working directory in ..
function savewd() {
    WD=`pwd | sed "s|.*/||"`
	cd ..
	tar -cf "$WD[`date +\"%m-%d-%Y(%I-%M)\"`]".tar.gz $WD
	cd $WD
}

function gcurrentbranch() {
    echo `git branch | grep \* | cut -d ' ' -f2`
}

function gpcb() {
    git push origin `gcurrentbranch`
}

function gpcbf() {
    git push -f origin `gcurrentbranch`
}

function gbsetupstream {
    git branch --set-upstream-to=origin/`gcurrentbranch` `gcurrentbranch`
}

# Extract common file formats
function extract() {
	case "$@" in
	*.7z ) 7z x "$@" ;;
	*.tar.bz2 ) tar xvjf "$@" ;;
	*.bz2 ) bunzip2 "$@" ;;
	*.deb ) ar vx "$@" ;;
	*.tar.gz ) tar xvf "$@" ;;
	*.gz ) gunzip "$@" ;;
	*.tar ) tar xvf "$@" ;;
	*.tbz2 ) tar xvjf "$@" ;;
	*.tar.xz ) tar xvf "$@" ;;
	*.tgz ) tar xvzf "$@" ;;
	*.rar ) unrar x "$@" ;;
	*.zip ) unzip "$@" ;;
	*.Z ) uncompress "$@" ;;
	* ) echo " Unsupported file format" ;;
	esac
}
