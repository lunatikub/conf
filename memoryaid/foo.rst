***
Foo
***

**A lot of usefull commands**

.. contents:: Table of contents
              :local:

Disable screensaver
*******************

.. code-block:: bash

   xset s off -dpms
   gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
   gsettings set org.gnome.desktop.session idle-delay 0

Disable a device
****************

.. code-block:: bash

   xinput list
   xinput --disable <id>

Change runlevel
***************

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

Clean swap
**********

.. code-block:: bash

   swapoff –a
   swapon –a
   free && sync && echo 3 > /proc/sys/vm/drop_caches && free

Usb key
*******

.. code-block:: bash

   sudo fdisk -l # detect usb hard drive
   mkdir /media/foo # create mount point
   mount /dev/foo /media/foo # mount usb drive

Generate ssh key
****************

.. code-block:: bash

   ssh-keygen -t rsa -b 4096 -C "foo@bar.com"

Tags for emacs
**************

.. code-block:: bash

   find . -name "*.[chCH]" -print | etags -

Flash OS image to USB drive
***************************

balenaEtcher

Turn off usb drive write protect
********************************

.. code-block:: bash

   sudo hdparm -r0 /dev/foo
