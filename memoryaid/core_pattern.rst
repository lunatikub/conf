************
Core Pattern
************

.. contents:: Table of contents
              :local:

Get the limit size for the cores

.. code-block:: sh

   ulimit -c

Set unlimited size for the cores

.. code-block:: sh

   ulimit -c unlimited

   
Redirect all cores to `/tmp/cores/`

.. code-block:: sh
  
   mkdir -p /tmp/cores
   chmod a+rwx /tmp/cores
   sudo su
   echo "/tmp/cores/core.%e.%p.%h.%t" > /proc/sys/kernel/core_pattern

GDB

.. code-block:: sh

   gdb binary core
