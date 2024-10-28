.. _emacs:

*****
emacs
*****

.. code-block:: shell-session

   sudo apt install emacs

Doom
====

https://github.com/doomemacs/doomemacs

.. code:: bash

   # install
   URL="https://github.com/doomemacs/doomemacs"
   git clone --depth 1 $URL  ~/.config/emacs
   ~/.config/emacs/bin/doom install

Custom **doom** files location: https://github.com/lunatikub/conf/tree/master/doom.d

.. note::

   # ~/.zhsrc
   alias doom="~/.config/emacs/bin/doom"

+--------------------------------------------+
| Doom                                       |
+=============+==============================+
| C-h r r     | Reload                       |
+-------------+------------------------------+
| C-c o p     | Teemacs                      |
+-------------+------------------------------+
| C-c o e     | Eshell                       |
+-------------+------------------------------+
| C-c v g     | Magit                        |
+-------------+------------------------------+

JetBrains Font
==============

Download: https://www.jetbrains.com/lp/mono/

.. code-block:: shell-session

   $ cp ~/Downloads/JetBrainsMono-2.304.zip ~/.local/share/fonts
   $ cd ~/.local/share/fonts
   $ unzip JetBrainsMono-2.304.zip
   $ fc-cache -f -v

.. code-block:: emacs-lisp

   ;; JetBrains dooms
   (setq doom-font (font-spec :family "JetBrains Mono" :size 16)
   doom-variable-pitch-font (font-spec :family "Ubuntu" :size 15)
   doom-big-font (font-spec :family "JetBrains Mono" :size 24)) 

