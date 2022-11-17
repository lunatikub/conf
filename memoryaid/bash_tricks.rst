***********
Bash tricks
***********

.. contents:: Table of contents
              :local:

String - Text 
*************

**Get a filename from a path**

.. code-block:: bash

                # file="/path/to/file/filename.ext"
                $ basename $(file)
                filename.ext

**Get a dirname from a path**

.. code-block:: bash

                # file="/path/to/file/filename.ext"
                $ dirname $(file)
                /path/to/file/

                
**Remove a line in a file**

.. code-block:: bash

                sed -i '/pattern/d' file.txt
