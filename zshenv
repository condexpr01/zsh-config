
# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.local/cache

# language
export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8

# editor
export EDITOR="nvim"
export VISUAL="nvim-qt"

# ZSH
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh

# Gnu privacy guard
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# GTK2 open GUI lib
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc


# CURSOR
export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons

# npm
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm

# CUDA
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

#export XMODIFIERS=@im=fcitx
#export GTK_IM_MODULE=fcitx
#export GLFW_IM_MODULE=ibus
#export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
