# System-wide .bashrc file for interactive bash(1) shells.
alias c="clear"
alias r="cf -s"
alias du="du -sh *"
alias df="df -h"
alias p="pwd"
alias l="ls"
alias lh="ls -lh"
alias lt="ls -lht"
alias la="ls -lham"
alias lf="ls --full-time"
alias lft="ls --full-time -t"
alias 1="cd .."
alias 2="cd ../../"
alias n="nano"
alias w="cd ~/c/work/"
alias r="cd ~/r"
alias e="exit"
alias j="jobs -l"
alias X="chmod +x"
alias x="chmod -x"
alias eall="sudo nano ~/../../usr/bin/all.sh"
alias xdvd="clear;hodiny;dvd | wc -l"
alias rf="rm -rf"
alias ps="pstree -ap"
alias eye="eyeD3 --remove-all *.mp3"
alias eyework="find /mnt/c/work/ -name '*.mp3' -exec eyeD3 --remove-all {} \;"
alias eyemusic="find /mnt/c/Documents\ and\ Settings/DELL/Music/ -name '*.mp3' -exec eyeD3 --remove-all {} \;"
alias playlist="find . -type f \( -name '*.flac' -o -name '*.mp3' -o -name '*.m4a' \) -fprint playlist.m3u"
alias cl="clear;ls"
alias feh="feh -F -Z -d -D 1"
alias yp="yt-dlp --no-colors -c -nc -f 'worst[ext=mp4]' "
alias ypb="yt-dlp --no-colors -c -nc -f 'best[ext=mp4]' "
alias mpvs="mpv --quiet --loop -mute --osd-fractions --osd-level=3 --osd-font-size=40 --osd-color=#000000 --osd-border-color=#FFFFFF --osd-back-color=#FFFFFF $1"

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
# but only if not SUDOing and have SUDO_PS1 set; then assume smart user.
if ! [ -n "${SUDO_USER}" -a -n "${SUDO_PS1}" ]; then
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

# sudo hint
if [ ! -e "$HOME/.sudo_as_admin_successful" ] && [ ! -e "$HOME/.hushlogin" ] ; then
    case " $(groups) " in *\ admin\ *|*\ sudo\ *)
    if [ -x /usr/bin/sudo ]; then
	cat <<-EOF
	To run a command as administrator (user "root"), use "sudo <command>".
	See "man sudo_root" for details.
	
	EOF
    fi
    esac
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi
