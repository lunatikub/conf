**Prezto mode**

Follow README.md to install prezto mode  
https://github.com/sorin-ionescu/prezto

**Terminal urxvt**

Install urxvt and copy the Xdefaults configuration file

``` sh
cp $CONF/preztozsh/Xdefaults ~/.Xdefaults
```

**prompt**

``` sh
$ prompt -c
sorin
```

**prezto configuration**

> ~/.zpreztorc

Modules to be added

``` sh
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'prompt' \
  'git' \
  'history-substring-search'
```

**Load custom zsh configuration**

> ~/.zshrc

``` sh
# Load custom zsh configuraiton
CONF_PATH=/home/thomas/git/conf/preztozsh
CONF_FILES=("alias" "bindkey" "env" ...)

for ((i = 1; i <= ${#CONF_FILES[*]}; i++))
     {
         file=${CONF_FILES[$i]}
         source ${CONF_PATH}/${file}.sh
     }
```

