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
$PR_BLUE($PR_YELLOW%D{%H:%M:%S}$PR_BLUE)$PR_SHIFT_IN$PR_HBAR$PR_HBAR$PR_HBAR$PR_HBAR$PR_HBAR$PR_HBAR$PR_HBAR$PR_SHIFT_OUT\
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

    promptsize=$((promptsize + sz_branch))

    PR_FILLBAR="\${(l.(($TERMWIDTH - $promptsize))..${PR_HBAR}.)}"
}

set_prompt

#autoload -U promptinit
#promptinit
#prompt name
