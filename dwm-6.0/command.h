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
};

#endif /* !__COMMAND__ */
