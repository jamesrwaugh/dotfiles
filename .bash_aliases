# My Aliases to make life easier
alias ga='git add'
alias gc='git checkout'
alias gch='git checkout HEAD'
alias gcm='git commit -m'
alias gd='git diff'
alias gl='git log'
alias gr='git reset'
alias grh='git reset HEAD'
alias gs='git status'
alias gb='git branch'
alias gu='git reset --soft HEAD~1'
alias h='history'
alias c='clear'
alias cg='clear && gs'
alias logisim='java -jar ~/Downloads/logisim-generic-2.7.1.jar'
alias refbox='pushd ~/ssl-refbox-robocup-2014/ && ./sslrefbox && popd'

export MY_SIM_ADDRESS='131.247.14.106'
export QT_SIM_CLIENT='~/grSim/bin/client'

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



