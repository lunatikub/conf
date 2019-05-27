**Prezto mode**

Follow README.md  
https://github.com/sorin-ionescu/prezto

**Terminal urxvt**

``` sh
cp $CONF/preztozsh/Xdefaults ~/.Xdefaults
```

**prompt**

``` sh
$ prompt -c
sorin
```

**.zpreztorc**

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

