bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "\e[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-kill-word
bindkey "^[[3;5~" kill-word

#perso binding

f_ixe() {
    l_b_ixe=$(git branch)
}

zle -N ixe f_ixe

bindkey "^[1" ixe
