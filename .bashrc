# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
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
    alias ls='ls --color=auto --hyperlink=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Disable XON/XOFF flow control so Ctrl+S doesn't cause terminal to stop receiving input
stty -ixon

# Activate default virtual environment
source "$HOME/.local/share/venv/common/bin/activate"

# Set cache location for fetching CMake dependencies
export CPM_SOURCE_CACHE="$HOME/.cache/CPM"

# Use epdb as default python debugger
# export PYTHONBREAKPOINT="epdb.set_trace"

# Git aliases
alias gs="git status -sb"
alias gd="git diff"
alias gdc="git diff --cached"
alias gdi="git diff --no-index"
alias gl="git log --oneline --first-parent"
alias ga="git add -i"
alias gap="git add -p"
alias gca="git commit --amend --no-edit"
alias gcf="git commit --fixup"
alias grc="git rebase --continue"
alias gsu="git submodule sync --recursive && git submodule update --init --recursive"
alias gfr="git fetch Formlabs && git rebase -i Formlabs/master"
alias gsr="git show REBASE_HEAD"

# OpenVPN aliases
alias vpn-start="openvpn3 session-start --config formlabs"
alias vpn-pause="openvpn3 session-manage --config formlabs --pause"
alias vpn-resume="openvpn3 session-manage --config formlabs --resume"
alias vpn-stop="openvpn3 session-manage --config formlabs --disconnect"
alias vpn-status="openvpn3 sessions-list"

# For moving files and folders to the trash from the command line
alias trash="gio trash"

# For piping STDIN to the clipboard
alias clip="kitty +kitten clipboard"

# Add hyperlinks to grep results, which makes matches openable with a mouse click
alias rg="rg --hyperlink-format=kitty"

# For quickly running variants of clang-format-diff
alias cdm="clang-diff Formlabs/master HEAD"
alias cdc="clang-diff --cached"
alias cdh="clang-diff HEAD~1 HEAD"

# For paging though JSONL files
function jsonless {
    jq -sC '.[]' $@ | less -R
}

# For opening files (typically images) more easily
function open {
    echo $@ | xargs -n 1 xdg-open
}

# For showing what clang-format would change in recently edited sections
function clang-diff {
    # sudo apt install colordiff
    git diff -U0 --relative --no-color $@ | clang-format-diff -p1 | colordiff
}

# Ping a machine to make sure it's up and then ssh into it
function pingssh {
    INPUT="$1"
    shift
    REGEX="^([a-zA-Z0-9]*@)?(([a-zA-Z0-9-]+\.[a-z]+)|([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+))$"
    if [[ "$INPUT" =~ $REGEX ]]
    then
        BASE="${BASH_REMATCH[2]}"
        if [[ -z "$BASE" ]]
        then
            echo "Invalid input: missing group"
            return 2
        fi
        until ping -c1 -W1 -q "$BASE"; do sleep 1; done
        TERM=xterm-256color /usr/bin/ssh "$INPUT" $@
    else
        echo "Invalid input: no match"
        return 1
    fi
}

# For changing the color scheme when sshing into a remote machine
function colorssh {
    kitty @ set-colors ~/.config/kitty/themes/remote.conf
    pingssh $@
    kitty @ set-colors ~/.config/kitty/themes/Wez.conf
}
alias ssh="colorssh"
