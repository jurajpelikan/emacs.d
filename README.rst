My Emacs Configuration
======================


Installation
------------

* get source and create symlink
::

    git clone git://github.com/jurajpelikan/juraj-emacs.git
    ln -s ~/juraj-emacs ~/.emacs.d

*  set up virtualenv and install dependencies
::
   
    cd juraj-emacs
    virtualenv emacs_python --no-site-packages
    . emacs_python/bin/activate
    easy_install pip
    pip install -r pip_requirements.txt

TODO
----
* http://github.com/akaihola/flymake-python
