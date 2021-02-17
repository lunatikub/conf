******
Docker
******

.. contents:: Table of contents
              :local:

Dockerfile
**********

Create a docker image on bionic with simple packages.

.. code-block:: docker

   FROM ubuntu:bionic

   ENV FOO /var/lib/

   RUN apt-get update
   RUN apt-get install gcc make

Build 
*****
   
.. code-block:: bash

   docker build -t bionic .

.. note::

   **Dockerfile** has to exist !

Run
***

.. code-block:: bash

   docker run --init --privileged -t -d --hostname=bionic --name bionic -v /home/thomas/.ssh:/home/thomas/.ssh -v /home/thomas/git:/home/thomas/git -v /tmp:/tmp bionic
   
Start
*****

.. code-block:: bash

   docker start bionic

Exec
****

.. code-block:: bash

   sudo docker exec -i -e "TERM=xterm-256color" -t bionic su -l thomas
