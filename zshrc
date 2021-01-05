
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Load custom zsh configuraiton
CONF_PATH=/home/thomas/git/conf/preztozsh
CONF_FILES=("alias" "bindkey" "env" "helpers" "screen")

for ((i = 1; i <= ${#CONF_FILES[*]}; i++))
     {
         file=${CONF_FILES[$i]}
         source ${CONF_PATH}/${file}.sh
     }

source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
