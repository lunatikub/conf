.. _dwm:

=====
 dwm
=====

.. code-block:: shell-session

   # install
   $ make
   $ sudo make install

Depenencies:

.. code-block:: shell-session

   sudo apt install xsecurelock

Custom shortcuts:

.. code-block:: c

  // add a shorcut `config.h`
  static Key keys[] = {
    /* modifier                     key        function        argument */
    { MODKEY,                       XK_r,      spawn,          {.v = dmenu_cmd } },
    { MODKEY,                       XK_c,      spawn,          {.v = term_cmd } }
  ....
  };

  // add a command `command.h`
  static char *term_cmd[]  = {
    "xterm",
    "-fa",
    "Hack",
    "-fs",
    "14",
    NULL,
  };

Change runlevel
===============

+----------+--------------------+
| Runlevel | Target             |
+==========+====================+
| 0        | poweroff           |
+----------+--------------------+
| 1        | rescue             |
+----------+--------------------+
| 2,3,4    | multi-user         |
+----------+--------------------+
| 5        | graphical          |
+----------+--------------------+
| 6        | reboot             |
+----------+--------------------+

.. code-block:: bash

   sudo systemctl set-default multi-user.target

Disable screensaver
===================

.. code-block:: bash

   xset s off -dpms
   gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
   gsettings set org.gnome.desktop.session idle-delay 0

Xinitrc
=======

Depenencies:
 + xmodmap
 + ssh-agent
 + dmenu

.. code-block:: shell-session

   $ cp conf/config/xinitrc ~/.xinitrc
