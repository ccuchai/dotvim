Introduction
============

This is my vim configuration files

The following is the list of plugins currently used

* vundle - gmarik/vundle  
	* plugin management tool
*  nerdtree - scrooloose/nerdtree  
	* tree structure of quickly access filesystem
* vim-nerdtree-tabs - jistr/vim-nerdtree-tabs  
	* tabpage of nerdtree
* taglist - vim-scripts/taglist  
	* show tags (function definition, variable definition)
* vim-easymotion - Lokaltog/vim-easymotion  
	* a fantastic way of movement, quickly jumping to any location in the screen
* ctags - vim-scripts/ctags  
	* necessary tool to do code tracing
* ListToggle - Valloric/ListToggle  
	* quick open/close the quickfix list in vim
* YouCompleteMe - Valloric/YouCompleteMe  
	* a powerful completion plugin for C-family language and Python

This project use 'vundle' to automatically manage/install/update/remove my vim's plugin,  
For more details, refer to [vundle](https://github.com/gmarik/vundle)   
or the kindly [introduction](http://blog.chh.tw/posts/vim-vundle/) written in Chinese.

Getting Started
===============

Simply open your vim:

    $ vim

You should see the following message:

    $ Installing Vundle..
      ...

And then install the plugins (you can remove plugins that you don't like)
    ![](http://i.imgur.com/W9XlccI.png)

For the completion feature, the quick installation is:

Compiling YCM with semantic support for C-family languages:

    $ cd ~/.vim/bundle/YouCompleteMe
    $ ./install.sh --clang-completer

Compiling YCM without semantic support for C-family languages:

    $ cd ~/.vim/bundle/YouCompleteMe
    $ ./install.sh

Compiling YCM with semantic support for Go languages:

    $ cd ~/.vim/bundle/YouCompleteMe
    $ ./install.py --gocode-completer

Compiling YCM with semantic support for Javascript languages:

    $ cd ~/.vim/bundle/YouCompleteMe
    $ ./install.py --tern-completer

For more installation detail, please see the document of [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

All done! Hope you enjoy it.

F & Q
=====

libtinfo.so missing for YCM in arch linux

    $ ln -s /usr/lib/libncursesw.so.6 /usr/lib/libtinfo.so.5

RuntimeError: Warning: Unable to detect a .tern-project file in the hierarchy before xxxxx and no global .tern-config file was found. This is required for accurate JavaScript completion. Please see the User Guide for details.

    $ ln -s ~/config/dotfiles/tern-config ~/.tern-config

Demos
=====
Press F2 to open [nerdtree](https://github.com/scrooloose/nerdtree) and [nerdtree-tab](https://github.com/jistr/vim-nerdtree-tabs)
![](http://i.imgur.com/6EKA9Vk.png)

Press F3 to open [taglist]()
![](http://i.imgur.com/ivPue02.png)

The completion realized thank to [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
![](http://i.imgur.com/UHQpGTT.png)

The quickly easy movement realized thank to [vim-easymotion](https://github.com/Lokaltog/vim-easymotion)
![](http://i.imgur.com/3N2lOuw.png)
