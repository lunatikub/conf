******
Docker
******

.. code-block:: bash

   docker build -t <name> -f Dockerfile .

.. code-block:: bash

   # Share volume
   $ docker run -td -v path:path ...
   
.. code-block:: shell-session

   $ docker exec -it <id> bash

.. code-block:: shell-session

   # remove all containers
   $ docker rm -f $(docker ps -aq)
   
.. code-block:: shell-session

   # remove all images
   $ docker rmi -f $(docker images -aq) 

   
