# My Aliases to make life easier
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
alias h='history'
alias c='clear'
alias cg='clear && gs'
alias logisim='java -jar ~/Downloads/logisim-generic-2.7.1.jar'
alias refbox='pushd ~/ssl-refbox/ && ./sslrefbox && popd'
export MY_SIM_ADDRESS='131.247.14.106'
export QT_SIM_CLIENT='~/grSim/bin/client'
export PS1="\[$(tput bold)\]\[$(tput setaf 6)\]\u@\h:\W\\$ \[$(tput sgr0)\]"

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

#set /usr/local/lib and . as library path
function lld() {
	export LD_LIBRARY_PATH='/usr/local/lib:.'
}

# "Git clone branch"
function gclb() {
	git checkout -b $1 origin/$1
}
    
#Save a tar.gz of the working directory in ..
function savewd() {
    WD=`pwd | sed "s|.*/||"`
	cd ..
	tar -cf "$WD[`date +\"%m-%d-%Y(%I-%M)\"`]".tar.gz $WD
	cd $WD
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
