# ccache
export PATH="/usr/lib/ccache/:$PATH"
export CCACHE_DIR="/dev/shm/ccache"
ccache --max-size=8G >/dev/null 2>/dev/null

# default zone
export TZ=Europe/Paris

# default editor
export EDITOR="emacs"
export VISUAL="emacs"

export PATH=$PATH:~/.local/bin
