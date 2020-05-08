#!/bin/bash

export PATH=/usr/local/sbin:$PATH
export PATH=~/bin:$PATH
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced

alias node="~/node/node-v13.12.0-linux-x64/bin/node"
alias  npm="~/node/node-v13.12.0-linux-x64/bin/npm"

function darwin() { [ $(uname) == 'Darwin' ]; }
function linux()  { [ $(uname) == 'Linux'  ]; }

function scan() {
    echo $1.{1..254} | xargs -P 254 -n 1 ping -s 56 -c 1 -t 1 | grep ttl
}


#### PS1
GIT_PS1_SHOWDIRTYSTATE=true      # *:unstaged, +:staged
GIT_PS1_SHOWUNTRACKEDFILES=true  # %:untracked
GIT_PS1_SHOWSTASHSTATE=true      # $:stashed
GIT_PS1_SHOWUPSTREAM=auto        # >:ahead, <:behind
GIT_PS1_STATESEPARATOR=':'
source ~/.git-completion.bash
source ~/.git-prompt.sh
function rev()   { echo -n "\[\e[07m\]" ;}
function reset() { echo -n "\[\e[00m\]" ;}
function line()  { echo -n "\[\e[04m\]" ;}
## \[ \] （文字数除外）で囲わないと表示が時々おかしくなるよ
#PS1="\n$(rev)[\u@$(hostname -f):\w$(__git_ps1 "(%s)")]$(reset)\n--> "
#PS1="[\u@$(hostname -f):\w$(__git_ps1 "(%s)")] "
#PS1="$(rev)[\w]$(reset) "
#PS1="$(rev)[\w]$(__git_ps1 "(%s)")$(reset) "
#PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
PROMPT_COMMAND='__git_ps1 "$(rev)[\w]$(reset)" " "'
	
#### ls
darwin && alias  ls='exa'
darwin && alias  la='exa -a'
darwin && alias  ll='exa -l'
darwin && alias lla='exa -la'
linux  && alias  ls='ls    --color=auto'
linux  && alias  la='ls -A --color=auto'
linux  && alias  ll='ls -l --color=auto'
linux  && alias lla='ls -la --color=auto'

#### emacs
alias emacs='emacs -nw'
alias e='emacs -nw'
linux  && alias vim='nvim'
linux  && alias v='nvim'

alias src="cd ~/src"
alias dot="cd ~/src/dotfiles"
alias junk="cd ~/src/JUNK"
alias sand="cd ~/src/sandbox"
alias bs='browser-sync start --server --files "./**/*.html" --files "./**/*.css" --files "./**/*.js"'
alias clamav="sudo freshclam;sudo clamscan -r -i"
#alias sakura='mosh --ssh="ssh -p 22000" makyos@www11364ue.sakura.ne.jp'
alias sakura='ssh -p 22000 makyos@www11364ue.sakura.ne.jp'
alias bashrc=". ~/.bashrc"
alias .bashrc="cd ~; vim .bashrc; bashrc; cd -"
alias vimrc="cd ~/.config/nvim; vim init.vim; cd -"
alias rust="evcxr"
alias tmux0="tmux a -t 0 -d"
alias @="tmux a -t 0 -d"
alias .tmux='vim ~/.tmux.conf'

darwin && alias wifi="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -s"
#darwin && alias sw="xcrun swift"
darwin && alias t="open -a /Applications/Utilities/Terminal.app ."
darwin && alias brew_cask_upgrade='for c in `brew cask list`; do ! brew cask info $c | grep -qF "Not installed" || brew cask install $c; done'


darwin && alias fsw='fswatch -o . | xargs -n1 -I{} '


#### homebrew
darwin && export NODEBREW_ROOT=$HOME/.nodebrew
darwin && . ~/.token

## sudo complete
complete -cf sudo


## DOCKER
alias dc-ps='docker container ps -a --format "table{{.ID}}\t{{.Names}}\t{{.Ports}}\t{{.Status}}"'
function dcsh() {
	docker container run -e USER=$USER -u $(id -u):$(id -g) -v $PWD:$PWD -w ${PWD} --rm -it ${1} /bin/sh
}
function dcsh-su() {
	docker container run -v ${PWD}:${PWD}:delegated -w ${PWD} --rm -it ${1} /bin/sh
}
function dc-exec-sh() {
	docker container exec -e USER=$USER -u $(id -u):$(id -g) -it ${1} /bin/sh
}
function dc-exec-sh-su() {
	docker container exec -it ${1} /bin/sh
}

function dcimg() { docker images --format "{{.Repository}}:{{.Tag}}" | sort | fzf ;}

function dcrun() {
	docker container run \
		-e USER=${USER} \
		-u $(id -u):$(id -g) \
		-v ${PWD}:${PWD}:delegated \
		-w ${PWD} \
		--rm -it ${@}
}

alias dox='docker exec -it `docker ps --format "{{.Names}}" | fzf` bash'

#	NODE="-p 3000:3000 node:lts-alpine"
#		function node() { dcrun $NODE "node ${@}" ;}
#		function npm()  { dcrun $NODE "npm  ${@}" ;}

##	RUST="rustlang/rust:nightly"
##	RUST="rust:latest"                   ; RUSTREG="/usr/local/cargo/registry"
#	RUST="ekidd/rust-musl-builder:latest"; RUSTREG="/home/rust/.cargo/registry"
#		function cargo()  {
#			mkdir -p ${PWD}/registry
#			dcrun -v ${PWD}/registry:$RUSTREG $RUST "cargo ${@}"
#		}
#		function rustup() { dcrun $RUST "rustup ${@}" ;}

[ -e $HOME/.cargo/env ] && source $HOME/.cargo/env

#	PYTHON2="python:2-alpine"
#		function py2()  { dcrun $PYTHON2 python ${@} ;}
#		function pip2() { dcrun $PYTHON2 pip    ${@} ;}
##		function pip2() { dcrun $PYTHON2 pip -t ./pip ${@} ;}


function fw()       { sudo firewall-cmd --zone=public --list-all ;}
function fw-open()  { sudo firewall-cmd --zone=public --add-port=${1}/tcp;    fw ;}
function fw-close() { [ ${1} != "22000" ] && sudo firewall-cmd --zone=public --remove-port=${1}/tcp; fw ;}

function today() { date +%Y-%m%d ;}

function pora() { if [ -p /dev/stdin ]; then cat -; else echo ${@}; fi ;}

function killmosh() { kill $(pidof mosh-server) ;}

function tgz() {
	local D=/tmp/${HOSTNAME}__$(yyyy)-$(mo)$(dd)
	for f in "$(pora ${@})"; do
		ff=$(readlink -f ${f})
		dd=${D}$(dirname ${ff})
		mkdir -p ${dd}
		cd $(dirname ${ff})
		tar zcf ${dd}/$(basename ${ff}.tgz) $(basename ${ff})
		cd - > /dev/null
		ls -lh ${dd}/$(basename ${ff}.tgz)
	done
}

function yyyy() { date "+%Y" ;}
function   mo() { date "+%m" ;}
function   dd() { date "+%d" ;}
function   hh() { date "+%H" ;}
function   mi() { date "+%M" ;}
function   ss() { date "+%S" ;}
function   ns() { date "+%N" ;}
function   wd() { date "+%a" ;}

function httpd() {
	local P="${1}"
	[ ${P} != "" ] && P=8080
	fw-open ${P}
	echo ${HOSTNAME}:${P}
	python -m SimpleHTTPServer ${P}
	fw-close ${P}
}

function findnew() {
	inai_sec=${1}
	while true; do
		if [ ! -z $(find ${2} -type f -newermt "$(date "+%Y-%m-%d %H:%M:%S" --date "${inai_sec} seconds ago")") ]; then
			eval "${3}"
			echo; echo
		fi
		sleep ${inai_sec}
	done
}

function cs() {
	fw-open 8080
	docker run --rm -it -p 8080:8080 -u $(id -u):$(id -g) -v "${HOME}/.local/share/code-server:/home/coder/.local/share/code-server" -v "$PWD:/home/coder/project" codercom/code-server:v2
	fw-close 8080
}


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

function red()     { printf "%s\n" "$(tput setaf 1)${1}$(tput sgr0)" ;}
function green()   { printf "%s\n" "$(tput setaf 2)${1}$(tput sgr0)" ;}
function yellow()  { printf "%s\n" "$(tput setaf 3)${1}$(tput sgr0)" ;}
function cyan()    { printf "%s\n" "$(tput setaf 6)${1}$(tput sgr0)" ;}


