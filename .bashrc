export PATH=/usr/local/sbin:$PATH
export PATH=~/usr/bin:$PATH
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced


function darwin() { [ $(uname) == 'Darwin' ]; }
function linux()  { [ $(uname) == 'Linux'  ]; }

function scan() {
    echo $1.{1..254} | xargs -P 254 -n 1 ping -s 56 -c 1 -t 1 | grep ttl
}


#### PS1
## \[ \] （文字数除外）で囲わないと表示が時々おかしくなるよ
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
source ~/.git-completion.bash
source ~/.git-prompt.sh

function rev()   { printf "\[\e[07m\]" ;}
function reset() { printf "\[\e[00m\]" ;}
function line()  { printf "\[\e[04m\]" ;}
	PS1="\n$(rev)[\u@$(hostname -f):\w$(__git_ps1 "(%s)")]$(reset)\n--> "

#### ls
darwin && alias ls='ls'
darwin && alias la='ls -a'
darwin && alias ll='ls -l'
linux  && alias ls='ls    --color=auto'
linux  && alias la='ls -A --color=auto'
linux  && alias ll='ls -l --color=auto'

#### emacs
darwin && alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
linux  && alias emacs='emacs -nw'

alias src="cd ~/src"
alias junk="cd ~/src/JUNK"
alias sand="cd ~/src/sandbox"
alias bs='browser-sync start --server --files "./**/*.html" --files "./**/*.css" --files "./**/*.js"'
alias clamav="sudo freshclam;sudo clamscan -r -i"
#alias sakura='mosh --ssh="ssh -p 22000" makyos@www11364ue.sakura.ne.jp'
alias sakura='ssh -p 22000 makyos@www11364ue.sakura.ne.jp'
alias bashrc=". ~/.bashrc"

darwin && alias wifi="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -s"
darwin && alias sw="xcrun swift"
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
function dc-run-sh-cu() {
	docker container run -e USER=$USER -u $(id -u):$(id -g) -v $PWD:$PWD -w ${PWD} --rm -it ${1} /bin/sh
}
function dc-run-sh() {
	docker container run -v ${PWD}:${PWD}:delegated -w ${PWD} --rm -it ${1} /bin/sh
}
function dc-exec-sh-cu() {
	docker container exec -e USER=$USER -u $(id -u):$(id -g) -it ${1} /bin/sh
}
function dc-exec-sh() {
	docker container exec -it ${1} /bin/sh
}


function dcrun() {
	docker container run \
		-e USER=${USER} \
		-u $(id -u):$(id -g) \
		-v ${PWD}:${PWD}:delegated \
		-w ${PWD} \
		--rm -it ${@}
}

	NODE="-p 3000:3000 node:lts-alpine"
		function node() { dcrun $NODE "node ${@}" ;}
		function npm()  { dcrun $NODE "npm  ${@}" ;}

#	RUST="rustlang/rust:nightly"
#	RUST="rust:latest"                   ; RUSTREG="/usr/local/cargo/registry"
	RUST="ekidd/rust-musl-builder:latest"; RUSTREG="/home/rust/.cargo/registry"
		function cargo()  {
			mkdir -p ${PWD}/registry
			dcrun -v ${PWD}/registry:$RUSTREG $RUST "cargo ${@}"
		}
		function rustup() { dcrun $RUST "rustup ${@}" ;}

	PYTHON2="python:2-alpine"
		function py2()  { dcrun $PYTHON2 python ${@} ;}
		function pip2() { dcrun $PYTHON2 pip    ${@} ;}
#		function pip2() { dcrun $PYTHON2 pip -t ./pip ${@} ;}


function fw()       { sudo firewall-cmd --zone=public --list-all ;}
function fw-open()  { sudo firewall-cmd --zone=public --add-port=${1}/tcp;    fw ;}
function fw-close() { sudo firewall-cmd --zone=public --remove-port=${1}/tcp; fw ;}

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
	fw-open 8080
	echo ${HOSTNAME}:8080
	python -m SimpleHTTPServer 8080
	fw-close 8080
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



