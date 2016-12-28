export PATH=/usr/local/sbin:$PATH
export PATH=~/usr/bin:$PATH
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
# export PS1='\[\033[7m\]\u@\h:$PWD\[\033[0m\]\n\$ '
# export PS1='[\033[35m\u\033[00m@\033[33m\h\033[00m:\033[34m$PWD/\033[00m]\n\$ '
# export PS1='\033[35m\u\033[00m@\033[33m\h\033[00m:\033[34m$PWD/\033[00m \$ '
## \[ \] （文字数除外）で囲わないと表示が時々おかしくなるよ
# export PS1="😈  \[\e[1m\]\w \[\e[0m\]"
# export PS1="\e[1m\]\w \[\e[0m\]"
# export PS1="\[\e[1m\]\w \[\e[0m\]"

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
source ~/.git-prompt.sh

export PS1="◉ \[\e[1m\]\w \[\e[0m\]"
# PS1='\[\e[1;30m\]\H:\W$(__git_ps1 "(%s)")$(if [[ $? == 0 ]]; then echo "\[\e[0;32m\]"; else echo "\[\e[0;31m\]"; fi)$\[\e[0m\] '
# PS1='◉ \[\e[1m\]\w$(__git_ps1 "(%s)")$(if [[ $? == 0 ]]; then echo "\[\e[0;32m\]"; else echo "\[\e[0;31m\]"; fi) $\[\e[0m\] '
PS1='\[\e[1m\]\w$(__git_ps1 "(%s)") $ \[\e[0m\]'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias ls='ls -vF'
alias la='ls -va'
alias ll='ls -vl'
alias lla='ls -vla'
alias cdd='cd ..'
[ $(uname) == 'Darwin' ] && alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
[ $(uname) == 'Linux' ]  && alias emacs='emacs -nw'
alias alm="echo -n $'\a'"
alias rm="rm"
#alias tgz="tgz"
alias wifi="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -s"
alias gosh="rlwrap gosh"
alias memo="emacs ~/src/memo/memo.md"
alias brew_cask_upgrade='for c in `brew cask list`; do ! brew cask info $c | grep -qF "Not installed" || brew cask install $c; done'
alias v="vagrant"
alias src="cd ~/src"
alias sand="cd ~/src/sandbox"
alias sw="xcrun swift"
alias t="open -a /Applications/Utilities/Terminal.app ."
alias bs='browser-sync start --server --files "./**/*.html" --files "./**/*.css" --files "./**/*.js"'
alias bsmd='browser-sync start --server --files "./**/*.md"'


function tgz () {
    fname=${1%/}_$(date +"%s_$HOSTNAME").tgz
    tar zcf $fname ${1%/}
    ls -lh $fname
}


function rm () {
    local path
    for path in "$@"; do
	# ignore any arguments
	if [[ "$path" = -* ]]; then :
	else
	    local dst=${path##*/}
	    # append the time if necessary
	    while [ -e ~/.Trash/"$dst" ]; do
		dst="$dst "$(date +%H-%M-%S)
	    done
	    mv "$path" ~/.Trash/"$dst"
	fi
    done
}

# eval $(docker-machine env default)

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export PATH=$PATH:/usr/local/share/npm/bin

export NODEBREW_ROOT=$HOME/.nodebrew
export PATH=$NODEBREW_ROOT/current/bin:$PATH

## Microsoft PICT
export PATH=~/src/GITHUB/pict:$PATH
