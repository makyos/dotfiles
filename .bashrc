export PATH=/usr/local/sbin:$PATH
export PATH=~/usr/bin:$PATH
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

<<<<<<< HEAD
function tgz () {
    fname=${1%/}_$(date +"%s_$HOSTNAME").tgz
    tar zcf $fname ${1%/}
    ls -lh $fname
}


# function rm () {
#     local path
#     for path in "$@"; do
# 	# ignore any arguments
# 	if [[ "$path" = -* ]]; then :
# 	else
# 	    local dst=${path##*/}
# 	    # append the time if necessary
# 	    while [ -e ~/.Trash/"$dst" ]; do
# 		dst="$dst "$(date +%H-%M-%S)
# 	    done
# 	    mv "$path" ~/.Trash/"$dst"
# 	fi
#     done
# }

function darwin() { [ $(uname) == 'Darwin' ]; }
function linux()  { [ $(uname) == 'Linux'  ]; }

function dbash() {
    docker exec -it $1 /bin/bash
}

function scan() {
    echo $1.{1..254} | xargs -P 254 -n 1 ping -s 56 -c 1 -t 1 | grep ttl
}
=======
function darwin() { [ $(uname) == 'Darwin' ]; }
function linux()  { [ $(uname) == 'Linux'  ]; }
>>>>>>> a88a8b430a4652c68567da3a252a4bd3c5a851b5


#### PS1
## \[ \] （文字数除外）で囲わないと表示が時々おかしくなるよ
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
source ~/.git-completion.bash
source ~/.git-prompt.sh
<<<<<<< HEAD

function revbg() { printf "\033[07m${1}\033[00m"; }
function redbg() { printf "\033[41m${1}\033[00m"; }
# function myps1() { [ $? == 0 ] && export PS1="$(revbg $(pwd)) " || export PS1="$(redbg $(pwd)) ";}
# PROMPT_COMMAND=myps1

PS1='\[\033[7m\]\w$(__git_ps1 "(%s)")\[\033[0m\] '
=======
#PS1='\[\e[1m\]\w$(__git_ps1 "(%s)")\n$ \[\e[0m\]'
#PS1='\[\033[07m\e[1m\]\w$(__git_ps1 "(%s)")\033[00m\n$ \[\e[0m\]'
#PS1='\[\033[07m\e[1m\]# \u@\h:\w$(__git_ps1 "(%s)") \033[00m\n# \[\e[0m\]'
#PS1_DECO_REVERSE="\[\033[7m\]"
#PS1_DECO_UNDLINE="\[\033[4m\]"
#PS1_DECO_END="\[\033[0m\]"
#PS1='\[\033[7m\] \u@\h:\w$(__git_ps1 "(%s)") \[\033[0m\]\n\$ '
PS1='\n\[\033[7m\]\u@$(hostname -f):\w$(__git_ps1 "(%s)")\[\033[0m\]\n→ '
>>>>>>> a88a8b430a4652c68567da3a252a4bd3c5a851b5

#### ls
alias cdd='cd ..'

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
alias v="vagrant"
alias src="cd ~/src"
alias sand="cd ~/src/sandbox"
alias bs='browser-sync start --server --files "./**/*.html" --files "./**/*.css" --files "./**/*.js"'
alias clamav="sudo freshclam;sudo clamscan -r -i"
alias dps='docker ps --format "{{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias gtags="gtags --gtagslabel=pygments"
alias htags="htags -Fosn"
#alias sakura='mosh --ssh="ssh -p 22000" makyos@www11364ue.sakura.ne.jp'
alias sakura='ssh -p 22000 makyos@www11364ue.sakura.ne.jp'

darwin && alias wifi="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -s"
darwin && alias sw="xcrun swift"
darwin && alias t="open -a /Applications/Utilities/Terminal.app ."
<<<<<<< HEAD
darwin && alias brew_cask_upgrade='for c in `brew cask list`; do ! brew cask info $c | grep -qF "Not installed" || brew cask install $c; done'


darwin && alias fsw='fswatch -o . | xargs -n1 -I{} '

export PATH=$PATH:/usr/local/share/npm/bin
=======
>>>>>>> a88a8b430a4652c68567da3a252a4bd3c5a851b5

#### homebrew
darwin && export NODEBREW_ROOT=$HOME/.nodebrew
darwin && . ~/.token

<<<<<<< HEAD
## Docker
# linux && DOCKER_HOST="tcp://0.0.0.0:2375"

## TMUX
# alias tmuxn='tmux new -s $(basename $PWD)'
# alias tmuxa='tmux a -t $(basename $PWD)'
# tmux ls

#linux && /usr/lib/mozc/mozc_renderer &

=======
>>>>>>> a88a8b430a4652c68567da3a252a4bd3c5a851b5
## sudo complete
complete -cf sudo

## Rust
#source $HOME/.cargo/env

## DOCKER
function docker-sh-cu() {
	docker container run -u $(id -u):$(id -g) -v $PWD:$PWD -w $PWD --rm -it ${1} /bin/sh
}

<<<<<<< HEAD
## go
# export GOENV_ROOT="$HOME/.goenv"
# export PATH="$GOENV_ROOT/bin:$PATH"
# eval "$(goenv init -)"

## pyenv
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
=======
function docker-sh() {
	docker container run -v $PWD:$PWD -w $PWD --rm -it ${1} /bin/sh
}

>>>>>>> a88a8b430a4652c68567da3a252a4bd3c5a851b5
