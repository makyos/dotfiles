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

function revbg() { printf "\033[07m${1}\033[00m"; }
function redbg() { printf "\033[41m${1}\033[00m"; }
# function myps1() { [ $? == 0 ] && export PS1="$(revbg $(pwd)) " || export PS1="$(redbg $(pwd)) ";}
# PROMPT_COMMAND=myps1

PS1='\n\[\033[7m\]\u@$(hostname -f):\w$(__git_ps1 "(%s)")\[\033[0m\]\n→ '

#### ls
darwin && alias ls='ls -v'
darwin && alias la='ls -va'
darwin && alias ll='ls -vl'
darwin && alias lla='ls -vla'
linux  && alias ls='ls -vF --color'
linux  && alias la='ls -va --color'
linux  && alias ll='ls -vl --color'
linux  && alias lla='ls -vla --color'

#### emacs
darwin && alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
linux  && alias emacs='emacs -nw'

alias gosh="rlwrap gosh"
alias memo="emacs ~/src/memo/memo.md"
alias src="cd ~/src"
alias sand="cd ~/src/sandbox"
alias bs='browser-sync start --server --files "./**/*.html" --files "./**/*.css" --files "./**/*.js"'
alias clamav="sudo freshclam;sudo clamscan -r -i"
#alias sakura='mosh --ssh="ssh -p 22000" makyos@www11364ue.sakura.ne.jp'
alias sakura='ssh -p 22000 makyos@www11364ue.sakura.ne.jp'

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

## Rust
#source $HOME/.cargo/env

## DOCKER
function docker-sh-cu() {
	docker container run -u $(id -u):$(id -g) -v $PWD:$PWD -w $PWD --rm -it ${1} /bin/sh
}
function docker-sh() {
	docker container run -v $PWD:$PWD -w $PWD --rm -it ${1} /bin/sh
}

