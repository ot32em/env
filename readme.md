*Install script*
    
    $> cd ~
    $> sh install/install.sh

    It will do following things:
        1. Backup original rc files to $HOME/.oldrc(mkdir if not exists).
        2. Making new rc files to "$HOME/" .
        3. These new rc files are just doing by-pass refernce.
            for example $HOME/.bashrc, only one line code in it:
                source $HOME/env/bashrc

*What are inside?*
	
    "vim folder" provides my favorite "jellybean.vim" theme
    "vimrc" set following things:
    	1. normalize the indent-tab (shiftwidth, tabstop, softtabstop, expandtab, ai)
        2. encoding utf-8
        3. turn on syntax

    "bashrc" set following things:
        1. set prompt like "ot32em@myhost [~]$ " with colorized format
        2. set env variable TERM to "256color" for supporting jellybean 256 color theme.
        3. add some common short cut alias like la = ls -a, ll = ls -l, etc.

    "tmux.conf" set following things:
        1. ctrl-a is ergonomic violation prefix function key, changed to ctrl-b
        2. map "-" to split panes horizontally and "|" to split vertically
        3. map vim-like style move window by h, j, k, and l 
