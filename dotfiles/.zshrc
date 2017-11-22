# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# DOTFILE DIR
export DOTFILES_DIR=${HOME}/.dotfiles

# Path to your oh-my-zsh installation.     
export ZSH=${DOTFILES_DIR}/install/oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="xta0"

# Would you like to use another custom folder than $ZSH/custom?
export ZSH_CUSTOM=${ZSH}/custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( git z )

#run oh-my-zsh config
. $ZSH/oh-my-zsh.sh

#source profile
. ~/.profile


#soruce plugins
. $ZSH/plugins/z/z.sh