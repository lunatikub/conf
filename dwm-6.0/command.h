#ifndef __COMMAND__
#define __COMMAND__

static const char *dmenu_cmd[] = {
  "dmenu_run",
  "-fn", font,
  "-nb", normbgcolor,
  "-nf", normfgcolor,
  "-sb", selbgcolor,
  "-sf", selfgcolor,
  NULL
};

static char *term_cmd[]  = {
  "xterm",
  "-fa",
  "'Monospace'",
  "-fs",
  "14",
  NULL,
};

static char *emacsclient_cmd[] = {
  "emacsclient",
  "--create-frame",
  NULL,
};

static char *emacs_cmd[] = {
  "emacs",
  "--quick",
  "--no-init-file",
  "-l",
  "~/git/conf/emacs.d/emacs.el",
  NULL,
};

#endif /* !__COMMAND__ */
