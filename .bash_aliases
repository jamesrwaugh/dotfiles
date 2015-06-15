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
alias refbox='pushd ~/ssl-refbox-robocup-2014/ && ./sslrefbox && popd'
alias sa='sudo apt-get'
alias sai='sudo apt-get install'

export MY_SIM_ADDRESS='131.247.14.106'
export QT_SIM_CLIENT='~/grSim/bin/client'

# "Git clone branch"
function gclb() {
	git checkout -b $1 origin/$1
}

function saverobobulls() {
	cd ..
	tar -cf "robobulls2[`date +\"%m-%d-%Y(%I-%M)\"`]".tar.gz robobulls2/
	cd robobulls2
}

function saverobobullsb4c() {
	cd ..
	tar -cf "robobulls2[`date +\"%m-%d-%Y(%I-%M)B4C\"`]".tar.gz robobulls2/
	cd robobulls2
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
