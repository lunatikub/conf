***
Foo
***

**A lot of usefull commands**

.. contents:: Table of contents
              :local:

Python HTTP server bind in local
********************************

.. code-block:: bash

                python3 -m http.server 8888 --bind 0.0.0.0
                 
Mount android phone
*******************

.. code-block:: bash

                mkdir ~/mtp
                jmtpfs ~/mtp
                

Disable a device
****************

.. code-block:: bash

   xinput list
   xinput --disable <id>


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
