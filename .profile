# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022


# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/var/lib"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_LOG_HOME="$HOME/.local/var/log"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$UID}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}"

# Custom vars
export REPO_DIR="${XDG_DATA_HOME}/git"
export PASSWORD_STORE_DIR="${XDG_STATE_HOME}/password-store"

# Wayland vars
export XDG_CURRENT_DESKTOP="sway"
export XDG_SESSION_TYPE="wayland"
export RTC_USE_PIPEWIRE=true
export SDL_VIDEODRIVER="wayland"
export MOZ_ENABLE_WAYLAND=1
export CLUTTER_BACKEND="wayland"
export ELM_ENGINE="wayland_egl"
export ECORE_EVAS_ENGINE="wayland-egl"
export QT_QPA_PLATFORM="wayland-egl"
export _JAVA_AWT_WM_NONREPARENTING=1

# XDG User directories
if [ ! -d "$HOME/dls" ] ; then
	mkdir -p "$HOME/dls"
	xdg-user-dirs-update --set DOWNLOAD ~/dls
fi

if [ ! -d "$HOME/pics" ] ; then
	mkdir -p "$HOME/pics"
	xdg-user-dirs-update --set PICS ~/pics
fi

if [ ! -d "$HOME/docs" ] ; then
	mkdir -p "$HOME/docs"
	xdg-user-dirs-update --set DOCUMENTS ~/docs
fi

if [ ! -d "$HOME/music" ] ; then
	mkdir -p "$HOME/music"
	xdg-user-dirs-update --set MUSIC ~/music
fi

if [ ! -d "$HOME/pics" ] ; then
	mkdir -p "$HOME/pics"
	xdg-user-dirs-update --set PICTURES ~/pics
fi

if [ ! -d "$HOME/vids" ] ; then
	mkdir -p "$HOME/vids"
	xdg-user-dirs-update --set VIDEOS ~/vids
fi

# SHELL
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export SHELL=$(which zsh)

# GPG
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# SSH
export SSH_AGENT_PID=""
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

# VIM
export GVIMINIT='let $MYGVIMRC="$XDG_CONFIG_HOME/vim/gvimrc" | source $MYGVIMRC'
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
