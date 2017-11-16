export PATH=/usr/local/sbin:$PATH
export PATH=~/usr/bin:$PATH
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

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

function darwin() {
    [ $(uname) == 'Darwin' ]
}

function linux() {
    [ $(uname) == 'Linux'  ]
}


#### PS1
## \[ \] （文字数除外）で囲わないと表示が時々おかしくなるよ
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
source ~/.git-completion.bash
source ~/.git-prompt.sh
#PS1='\[\e[1m\]\w$(__git_ps1 "(%s)")\n$ \[\e[0m\]'
#PS1='\[\033[07m\e[1m\]\w$(__git_ps1 "(%s)")\033[00m\n$ \[\e[0m\]'
#PS1='\[\033[07m\e[1m\]# \u@\h:\w$(__git_ps1 "(%s)") \033[00m\n# \[\e[0m\]'
PS1_DECO_REVERSE="\[\033[7m\]"
PS1_DECO_UNDLINE="\[\033[4m\]"
PS1_DECO_END="\[\033[0m\]"
PS1='\[\033[7m\] \u@\h:\w$(__git_ps1 "(%s)") \[\033[0m\] '

#### ls
alias cdd='cd ..'
darwin && alias ls='ls -vF'
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

alias alm="echo -n $'\a'"
alias rm="rm"
alias gosh="rlwrap gosh"
alias memo="emacs ~/src/memo/memo.md"
alias v="vagrant"
alias src="cd ~/src"
alias sand="cd ~/src/sandbox"
alias bs='browser-sync start --server --files "./**/*.html" --files "./**/*.css" --files "./**/*.js"'
alias clamav="sudo freshclam;sudo clamscan -r -i"


darwin && alias wifi="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -s"
darwin && alias sw="xcrun swift"
darwin && alias t="open -a /Applications/Utilities/Terminal.app ."
darwin && alias brew_cask_upgrade='for c in `brew cask list`; do ! brew cask info $c | grep -qF "Not installed" || brew cask install $c; done'


##
# export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export PATH=$PATH:/usr/local/share/npm/bin

darwin && export NODEBREW_ROOT=$HOME/.nodebrew
darwin && export PATH=$NODEBREW_ROOT/current/bin:$PATH

## Microsoft PICT
export PATH=~/src/gitclone/pict:$PATH

## BREW API TOKEN
darwin && . ~/.token

## Docker
linux && DOCKER_HOST="tcp://0.0.0.0:2375"

## TMUX
alias tmuxn='tmux new -s $(basename $PWD)'
alias tmuxa='tmux a -t $(basename $PWD)'
tmux ls

#linux && /usr/lib/mozc/mozc_renderer &

## sudo complete
complete -cf sudo

## Rust
# source $HOME/.cargo/env

## embulk
export PATH="$HOME/.embulk/bin:$PATH"


## swift
SWIFT_ROOT="/home/eng/Downloads/swift-4.0-RELEASE-ubuntu16.10/usr"
linux && export PATH=${SWIFT_ROOT}/bin:"${PATH}"
linux && alias swift="swift -I ${SWIFT_ROOT}/lib/swift/clang/include"
