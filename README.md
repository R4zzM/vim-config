vim-config
==========

This is my personal vim setup. 
To install it in a UNIX environment, clone the repo and create symlinks to the
required files from in your home directory as shown below. 

```ln -s /path/to/vimrc ~/.vimrc
```
```ln -s /path/to/gvimrc ~/.gvimrc
```
```ln -s /path/to/vim ~/.vim
```

All plugins are managed by vundle and will not exist the first time vim is
started therefore you will likely see some error messages. 
To install the plugins run
```:BundleInstall
```
from inside vim. Restart vim to be on the safe side. Now everything should work
fine!
