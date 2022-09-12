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

/* static const char *lock_cmd[] = { */
/*   "i3lock-fancy", */
/*   "-p", */
/*   "-g", */
/*   "-t", */
/*   "PWD", */
/*   "-n", */
/* }; */

static char *term_cmd[]  = {
  "xterm",
  "-fa",
  "'Monospace'",
  "-fs",
  "13",
};

/* static char *sound_up[] = { */
/*   "amixer", */
/*   "-c", "1", */
/*   "set", */
/*   "Master", */
/*   "5%+", */
/* }; */

/* static char *sound_down[] = { */
/*   "amixer", */
/*   "-c", "1", */
/*   "set", */
/*   "Master", */
/*   "5%-", */
/* }; */

#endif /* !__COMMAND__ */
