#ifndef __CONFIG__
#define __CONFIG__

#include "const.h"
#include "command.h"

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8" };

static const Rule rules[] = {
  /* class      instance    title       tags mask     isfloating   monitor */
  { "google-chrome", NULL, NULL, 1 << 8, False, -1 },
};

/* layout(s) */
static const float mfact      = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;    /* number of clients in master area */
static const Bool resizehints = False; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
  /* symbol     arrange function */
  { "[]=",      tile },    /* first entry is default */
  { "><>",      NULL },    /* no layout function means floating behavior */
  { "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG)                                                \
  { MODKEY,                     KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

static Key keys[] = {
  /* modifier                     key        function        argument */
  { MODKEY,                       XK_r,      spawn,          {.v = dmenu_cmd } },
  { MODKEY,                       XK_c,      spawn,          {.v = term_cmd } },
  { MODKEY,                       XK_v,      spawn,          {.v = term_cmd_invert } },
  { MODKEY,                       XK_e,      spawn,          {.v = emacsclient_cmd } },
  { MODKEY,                       XK_w,      spawn,          {.v = emacs_cmd } },
  { MODKEY,                       XK_l,      spawn,          {.v = xsecurelock } },
  { MODKEY,                       XK_F6,     spawn,          {.v = up_gamma } },
  { MODKEY,                       XK_F5,     spawn,          {.v = down_gamma } },
  { MODKEY,                       XK_F3,     spawn,          {.v = up_volume } },
  { MODKEY,                       XK_F2,     spawn,          {.v = down_volume } },
  { MODKEY,                       XK_b,      togglebar,      {0} },
  { MODKEY,                       XK_Left,   focusstack,     {.i = +1 } },
  { MODKEY,                       XK_Right,  focusstack,     {.i = -1 } },
  { MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
  { MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
  { MODKEY,                       XK_equal,  setmfact,       {.f = -0.05} },
  { MODKEY,                       XK_minus,  setmfact,       {.f = +0.05} },
  { MODKEY,                       XK_Return, zoom,           {0} },
  { MODKEY,                       XK_Tab,    view,           {0} },
  { MODKEY,                       XK_x,      killclient,     {0} },
  { MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
  { MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
  { MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
  { MODKEY,                       XK_space,  setlayout,      {0} },
  { MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
  { MODKEY,                       XK_0,      view,           {.ui = ~0 } },
  { MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
  TAGKEYS(                        XK_1,                      0)
  TAGKEYS(                        XK_2,                      1)
  TAGKEYS(                        XK_3,                      2)
  TAGKEYS(                        XK_4,                      3)
  TAGKEYS(                        XK_5,                      4)
  TAGKEYS(                        XK_6,                      5)
  TAGKEYS(                        XK_7,                      6)
  TAGKEYS(                        XK_8,                      7)
  TAGKEYS(                        XK_9,                      8)
  { MODKEY|ShiftMask,             XK_q,      quit,           {0} },
  { MODKEY,                       XK_Up,     view_next_prev, {.i = +1} },
  { MODKEY,                       XK_Down,   view_next_prev, {.i = -1} },
  { MODKEY,                       XK_comma,  focusmon,       {.i = +1 } },
  { MODKEY,                       XK_period, focusmon,       {.i = -1 } },
  { MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = +1 } },
  { MODKEY|ShiftMask,             XK_period, tagmon,         {.i = -1 } },
  { MODKEY,                       XK_s,      view_next_auto, { .i = +1 }},
  { MODKEY,                       XK_p,      view_next_auto, { .i = -1 }},
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
  /* click                event mask      button          function        argument */
  { ClkWinTitle,          0,              Button2,        zoom,           {0} },
  { ClkStatusText,        0,              Button2,        spawn,          {.v = term_cmd } },
  { ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
  { ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
  { ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
  { ClkTagBar,            0,              Button1,        view,           {0} },
  { ClkTagBar,            0,              Button3,        toggleview,     {0} },
};

#endif /* !__CONFIG__ */
