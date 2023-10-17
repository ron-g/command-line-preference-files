#!/bin/bash

cp -prv \
.bash_aliases \
.bashrc \
.screenrc \
.vim* \
"${HOME}/"

cp -v tmux.conf /etc/

