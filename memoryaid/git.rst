***
git
***

Configuration
*************

Tell 'less' not to paginate if less than a page:

.. code-block:: bash

                export LESS*"-F -X $LESS"

Commands
********

.. code-block:: bash

                # rebase from master
                git pull --rebase origin master

                # reset from master
                git reset --hard origin/master

                # force with lease
                git push --force-with-lease

                # delete a local branch
                git branch -d branch

                # delete remote branch
                git push origin --delete branch


Sub-modules alias
*****************

.. code-block:: bash

                sub-grep * grep --recurse-submodules
                sub-diff * diff --submodule*diff
                sub-status * submodule foreach git status

