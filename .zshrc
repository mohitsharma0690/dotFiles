# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python ruby git-extras git-flow rails zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# aliases
alias vi="vim"
alias gst="git status"
alias gcm="git checkout master"
alias gpr="git pull --rebase"
alias gco="git checkout "
alias gl="git log"
alias gsubm="git submodule update --init --recursive"
alias simlock="cd /Users/mohitsharma/Library/Application\ Support/iPhone\ Simulator/6.1/"
alias simcp="cp -p ~/rescue.sqlite ./"
alias simsave="cp -p rescue.sqlite ~/rescue.sqlite"
alias pg="ping google.com"
alias pb="ping bing.com"
alias pgg="cd ~/projects/pocketGems/"

#Set the auto completion on
autoload -U compinit
compinit

# 
# #Lets set some options
setopt correctall
setopt autocd
setopt auto_resume
  
#  ## Enables the extgended globbing features
#  These are awesome
setopt extendedglob

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Use vi editing mode (and the ultimate key binding nirvana)
bindkey -v
bindkey "^P" vi-up-line-or-history
bindkey "^N" vi-down-line-or-history

bindkey "^[[1~" vi-beginning-of-line   # Home
bindkey "^[[4~" vi-end-of-line         # End
bindkey '^[[2~' beep                   # Insert
bindkey '^[[3~' delete-char            # Del
bindkey '^[[5~' vi-backward-blank-word # Page Up
bindkey '^[[6~' vi-forward-blank-word  # Page Down"]]]]"

[ -x "/Applications/MacVim.app/Contents/MacOS/Vim" ] && alias vim=/Applications/MacVim.app/Contents/MacOS/Vim

alias gl1="gl | head -1 | pbcopy"
