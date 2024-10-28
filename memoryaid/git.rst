.. _git:

***
git
***

.. code-block:: shell-session

                sudo apt install git
                cp config/gitconfig ~/.gitconfig

Worktree
========

.. code-block:: bash

                git worktree add -b <new-branch> <path_repo> <start-branch>
                git worktree list --verbose
                git worktree remove <path_repo>
                git worktree prune

Delta
=====

Syntax-highlighting pager for git, diff and grep output.

https://github.com/dandavison/delta

Paing
=============

Tell 'less' not to paginate if less than a page:

.. code-block:: bash

                export LESS*"-F -X $LESS"

Commands
========

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
=================

.. code-block:: bash

                sub-grep * grep --recurse-submodules
                sub-diff * diff --submodule*diff
                sub-status * submodule foreach git status

