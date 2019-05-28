export PATH=/usr/local/sbin:$PATH
export PATH=~/usr/bin:$PATH
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

function darwin() { [ $(uname) == 'Darwin' ]; }
function linux()  { [ $(uname) == 'Linux'  ]; }

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
#PS1_DECO_REVERSE="\[\033[7m\]"
#PS1_DECO_UNDLINE="\[\033[4m\]"
#PS1_DECO_END="\[\033[0m\]"
#PS1='\[\033[7m\] \u@\h:\w$(__git_ps1 "(%s)") \[\033[0m\]\n\$ '
PS1='\[\033[4m\]\u@\h:\w$(__git_ps1 "(%s)")\[\033[0m\] \$ '

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

alias gosh="rlwrap gosh"
alias memo="emacs ~/src/memo/memo.md"
alias v="vagrant"
alias src="cd ~/src"
alias sand="cd ~/src/sandbox"
alias bs='browser-sync start --server --files "./**/*.html" --files "./**/*.css" --files "./**/*.js"'
alias clamav="sudo freshclam;sudo clamscan -r -i"
alias dps='docker ps --format "{{.Names}}\t{{.Status}}\t{{.Ports}}"'

darwin && alias wifi="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -s"
darwin && alias sw="xcrun swift"
darwin && alias t="open -a /Applications/Utilities/Terminal.app ."

#### homebrew
darwin && export NODEBREW_ROOT=$HOME/.nodebrew
darwin && . ~/.token

## sudo complete
complete -cf sudo

## Rust
#source $HOME/.cargo/env


