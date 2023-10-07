#!/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Terminal Colors and effects

#COLORS
BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
YELLOW='\e[1;33m'
LIGHTBLACK='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
LIGHTBROWN='\e[1;33m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
LIGHTBROWN='\e[1;33m'

#EFFECTS
BLINK='\e[5m'
BOLD='\e[1m'
DIM='\e[2m'
UNDERLINED='\e[4m'
REVERSE='\e[7m'
HIDDEN='\e[8m'

#RESET
RESET='\e[0m'
RESETBOLD='\e[21m'
RESETDIM='\e[22m'
RESETUNDERLINE='\e[24m'
RESETBLINK='\e[25m'
RESETINVERT='\e[27m'
RESETHIDDEN='\e[28m'

#BACKGROUNDS
BGDEFAULT='\e[49m'
BGBLACK='\e[40m'
BGRED='\e[41m'
BGGREEN='\e[42m'
BGYELLOW='\e[43m'
BGBLUE='\e[44m'
BGMAGENTA='\e[45m'
BGCYAN='\e[46m'
BGLIGHTGRAY='\e[47m'
BGDARKGRAY='\e[100m'
BGLIGHTRED='\e[101m'
BGLIGHTGREEN='\e[102m'
BGLIGHTYELLOW='\e[103m'
BGLIGHTBLUE='\e[104m'
BGLIGHTMAGENTA='\e[105m'
BGLIGHTCYAN='\e[106m'
BGWHITE='\e[107m'

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

#export SSLKEYLOGFILE=~/.ssl-key.log

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=2000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]
then
	FGCOLORR2="$LIGHTBLUE"
	if [ $UID -eq 0 ]
	then
		Prefix='🔥🔥🔥 '
		FGCOLORR="$LIGHTRED"
		BGCOLORR="$BGBLACK"
	else
		Prefix='🍕 '
		FGCOLORR="$RED"
		BGCOLORR="$BGDEFAULT"
	fi
	#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h (\t) <\#>\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	PS1="${BGCOLORR}${Prefix}${debian_chroot:+($debian_chroot)}${FGCOLORR} <\#> \u@\h (\t) ${RESET}:${FGCOLORR2}\w${RESET}\$${BGDEFAULT} "
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

BHISTDIR=~/.BashHistories
if [ ! -d $BHISTDIR ]
then
	mkdir -p $BHISTDIR
fi
HISTFILE=$BHISTDIR/.bash_history_$(date '+%Y%m%d_%H_%M_%S.%N').txt

LIGHTGREEN='\033[1;32m'
OK=$LIGHTGREEN

printf "${OK}History file at '$HISTFILE'${RESET}\n"

