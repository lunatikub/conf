
ROOT_DIR=$(dirname $(readlink -f $0))

# default editor
export EDITOR="emacs"

# default zone
export TZ=Europe/Paris

# ccache
export PATH="/usr/lib/ccache/:$PATH"
export CCACHE_DIR="/dev/shm/ccache"
ccache --max-size=8G >/dev/null 2>/dev/null

# Ctrl -> <-
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[3;5~' kill-word
bindkey '^H'  backward-kill-word

# Alias
alias 'l=ls'
alias 'la=ls -A'
alias 'll=ls -l --color'
alias 'grep=grep --colour'
alias 'mkdir=mkdir -p'
alias 'e=emacs'
alias 'tag=find . -type f -name "*.[ch]" -not -name "*.regex.c" | etags -'

# history
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt sharehistory

# compsys initialization
autoload -U compinit
compinit

#zstyle
zstyle ':completion:*' completer _expand _complete _match
zstyle ':completion:*' completions 0
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '+m:{a-z}={A-Z} r:|[._-]=** r:|=**' '' '' '+m:{a-z}={A-Z} r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 1 numeric
zstyle ':completion:*' substitute 0
zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*' menu select=2
zstyle ":completion:*:descriptions" format "%B%d%b"

# File/directory completion, for cd command
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#lost+found' '(*/)#CVS'
zstyle ':completion:*' menu select=2
#  and for all commands taking file arguments
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'

# Prevent offering a file (process, etc) that's already in the command line.
zstyle ':completion:*:(rm|cp|mv|kill|diff|scp):*' ignore-line yes
# (Use Alt-Comma to do something like "mv abcd.efg abcd.efg.old")

# Completion selection by menu for kill
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# Filename suffixes to ignore during completion (except after rm command)
# This doesn't seem to work
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' '*?.old' '*?.pro' '*~'
zstyle ':completion:*:(^rm):*' ignored-patterns '*?.o' '*?.c~' '*?.old' '*?.pro' '*~'
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'

zstyle ':completion:*:*:rmdir:*' file-sort time

zstyle ':completion:*' local matt.blissett.me.uk /web/matt.blissett.me.uk

# CD to never select parent directory
zstyle ':completion:*:cd:*' ignore-parents parent pwd

## Use cache
# Some functions, like _apt and _dpkg, are very slow. You can use a cache in
# order to proxy the list of results (like the list of available debian
# packages)
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# prompt
set_prompt () {
    setopt prompt_subst
    autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
	colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
	eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
	eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
	(( count = $count + 1 ))
    done
    PR_NO_COLOUR="%{$terminfo[sgr0]%}"

    typeset -A altchar
    set -A altchar ${(s..)terminfo[acsc]}

    PR_SET_CHARSET="%{$terminfo[enacs]%}"
    PR_SHIFT_IN="%{$terminfo[smacs]%}"
    PR_SHIFT_OUT="%{$terminfo[rmacs]%}"

    PR_HBAR=${altchar[q]:--}

    PR_ULCORNER=${altchar[l]:--}
    PR_LLCORNER=${altchar[m]:--}
    PR_LRCORNER=${altchar[j]:--}
    PR_URCORNER=${altchar[k]:--}

    PR_TITLEBAR=$'%{\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\a%}'

    function git_branch
    {

        if [ -d .git ]
        then
        sed "s/.*\///" .git/HEAD
        else
            echo "X"
    fi
    }

    PROMPT='$PR_SET_CHARSET$PR_STITLE${(e)PR_TITLEBAR}\
$PR_CYAN$PR_SHIFT_IN$PR_ULCORNER$PR_BLUE$PR_HBAR$PR_SHIFT_OUT(\
$PR_GREEN%n@%m\
$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_HBAR$PR_SHIFT_OUT(\
$PR_CYAN%~$PR_BLUE)\
$PR_SHIFT_IN$PR_HBAR$PR_HBAR$PR_SHIFT_OUT\
$PR_GREEN($(git_branch))\
$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_CYAN${(e)PR_FILLBAR}$PR_BLUE$PR_HBAR$PR_SHIFT_OUT\
$PR_BLUE($PR_YELLOW%D{%H:%M:%S}$PR_BLUE)$PR_SHIFT_IN$PR_SHIFT_OUT\
$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\

$PR_CYAN$PR_SHIFT_IN$PR_LLCORNER$PR_BLUE$PR_HBAR$PR_SHIFT_OUT\
$PR_SHIFT_IN$PR_BLUE$PR_HBAR$PR_SHIFT_OUT(\
%(?..$PR_LIGHT_RED%?$PR_BLUE|)\
$PR_YELLOW%h\
$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_CYAN$PR_HBAR$PR_SHIFT_OUT>\
$PR_NO_COLOUR '

    PS2='$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_BLUE$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT(\
$PR_LIGHT_GREEN%_$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$PR_CYAN$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT$PR_NO_COLOUR '
}

function precmd {
    local TERMWIDTH
    ((TERMWIDTH = ${COLUMNS} - 1))

    branch=$(git_branch)
    sz_branch=$(echo $branch | wc -m)
    sz_branch=$((sz_branch + 1))

    local promptsize=${#${(%):--(%n@%m)-(%~)-(%H:%M:%S)-}}

    ADAPT=15

    promptsize=$((promptsize + sz_branch - $ADAPT))

    PR_FILLBAR="\${(l.(($TERMWIDTH - $promptsize))..${PR_HBAR}.)}"
}

set_prompt
