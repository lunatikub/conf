*****
Pyenv
*****

.. contents:: Table of contents
              :local:

Download & Install
==================

.. code-block:: shell-session

   $ curl https://pyenv.run | bash

Install a version of phyton
===========================

.. code-block:: shell-session

   $ pyenv install <version>

Create a virutal env
====================

.. code-block:: shell-session

   $ pyenv virtualenv <version> <name>

.. note::

   <version> must be installed

Use a virtual env in a directory
================================

.. code-block:: shell-session

   $ pyenv local <name>

List versions
=============

.. code-block:: shell-session

   $ pyenv versions
