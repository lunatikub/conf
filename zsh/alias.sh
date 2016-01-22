
# Short command aliases
alias 'l=ls'
alias 'la=ls -A'
alias 'll=ls -l'
alias 'grep=grep --colour'
alias 'mkdir=mkdir -p'

# Rdesktop
alias 'rd=xfreerdp -k en-us -g 1920x1060 -u joly -d jungle bouleau'

# Program aliases
alias valgrind_powa='valgrind --leak-check=full --show-reachable=yes --db-attach=yes'
alias callgrind_powa='valgrind --tool=callgrind --callgrind-out-file=after.cg  --dump-instr=yes --toggle-collect=uc_main --collect-jumps=yes --simulate-cache=yes'

# Locale aliases
alias cdw='cd /work/'

# NIX
alias chrome='~/.nix-profile/bin/chromium --proxy-auto-detect'
alias meld='~/.nix-profile/bin/meld'
alias 'e=~/.nix-profile/bin/emacs -Q -q -l /work/emacs/quick/quick.el'

# NREG
alias remote_nreg='/comptes/joly/public/remote_nreg_client.sh'

# Create tags
alias create_tags='find . -type f -name "*.[ch]" -not -name "*.regex.c" | etags -'
