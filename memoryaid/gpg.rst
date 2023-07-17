***
GPG
***

Export **public key** and add it in **github** or other git interface.

.. code-block:: bash

                gpg --armor --export foo@bar.fr

Extract private key for local git:

.. code-block:: bash

                gpg --list-secret-keys --keyid-format LONG foo@bar.fr

                sec   rsa4096/FOOBAR_1 2022-09-20 [SC] [expires: 2032-09-17]
                      FOOBAR_2
                uid                 [ultimate] Thomas Joly (Ledger GPG Key) foo@bar.fr
                ssb   rsa4096/FOOBAR_3

Add private key **FOOBAR_2** to **~/.gitconfig**

.. code-block:: ini

                [user]
                    name = Thomas Joly
                    email = foo@bar.fr
                    signingkey = FOOBAR_2

Indicate to sign commit

.. code-block:: bash

                git config --global commit.gpgsign true


Before commit or cherry-pick:

.. code-block:: bash

                export GPG_TTY=$(tty)
       
