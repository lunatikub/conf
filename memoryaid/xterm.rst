.. _xterm:

*****
xterm
*****

.. code:: shell-session

   $ sudo apt install xterm

.. code:: shell-session

   $ cp config/conf/xmodmaprc ~/.xmodmaprc
   $ cp config/conf/Xdefaults ~/.Xdefaults

**Xdefaults** is used to configure the xterm.

**xmodmaprc** have all the bindkeys for the keyboard.

----

.. code:: shell-session

   # reset the keyboard
   $ xmodmap -e "keysym Alt_R = Mode_switch Mode_switch Mode_switch Mode_switch"
   $ xmodmap ~/.xmodmaprc

----

In the file `xmodmaprc` you have all the bindkeys:

.. code:: shell-session

   $ cat ~/.xmodmaprc

   keycode 26 = e E eacute
   keycode 40 = d D egrave
   keycode 27 = r R ecircumflex
   keycode 38 = a A agrave
   keycode 24 = q Q acircumflex
   keycode 30 = u U ugrave
   keycode 54 = c C ccedilla
   keycode 32 = o O ocircumflex
