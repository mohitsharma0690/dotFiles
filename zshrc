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

# Add zfunc to be loaded
fpath=(~/.zfunc "${fpath[@]}")
autoload -Uz last_mod_dir

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
plugins=(git python pip ruby git-extras git-flow osx rails zsh-syntax-highlighting z colored-man-pages colorize vi-mode)

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
alias simcp="cp -p ~/dragons3d.sqlite ./"
alias simsave="cp -p dragons3d.sqlite ~/dragons3d.sqlite"
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

alias ctags=/usr/local/bin/ctags

# add python bindings for clang to search path
# export PYTHONPATH="${PYTHONPATH}:/Users/mohitsharma/projects/python-clang-bindings"
#export PYTHONPATH="${PYTHONPATH}:/usr/local/google_appengine" # add appengine

# add libclang to dynamic load path
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/"

# add the jsc source for javascript debugging (better to create a symlink) 
# alias jsc="/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc"

# Don't show warnings while running gitk
alias gitk='gitk 2>/dev/null'

alias deploy_dragons='python deploy.py -m smr --version mohit dragonsong --skip'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

bindkey "OA" history-search-backward # Up
bindkey "OB" history-search-forward # Down
bindkey 'OA' history-beginning-search-backward
bindkey 'OB' history-beginning-search-forward

alias src_ROS='cd /opt/ros/indigo && source setup.sh'

# add Annaconda to PATH
export PATH="/Users/mohit/bin/anaconda/bin:$PATH" 

# Add Matlab to PATH
export PATH="$PATH:/Applications/MATLAB_R2015a.app/bin"

. /Users/mohit/Projects/torch/install/bin/torch-activate

# Add alias for Lab work
alias ssh_lab_1='ssh -X mohit@128.2.194.56'
alias ssh_lab_2='ssh -X mohit@128.2.194.87'
alias ssh_lab_3='ssh -X mohit@128.2.194.84'

# Add custom binaries to PATH
export PATH="$PATH:/Users/mohit/bin"
# Prefer homebrew stuff (NOTE This forces to use brew python instead of /usr/bin/python
export PATH="/usr/local/bin:/usr/local/Cellar:$PATH"

export PATH=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH

# Make YouCompleteMe work. YCM was compiled with system python. I've to use homebrew pyton for theano etc.
# So to make all of this work together do this.

export PYTHONPATH="/Users/mohit/bin/anaconda/lib/python2.7/site-packages"
export PYTHONPATH="$PATH:/usr/local/Cellar/opencv3/HEAD-157a90a_4/lib/python2.7/site-packages"

alias theano_python_gpu='THEANO_FLAGS=blas.ldflags="-L/usr/lib/ -lblas",mode=FAST_RUN,device=gpu,floatX=float32,exception_verbosity=high python'
alias theano_python='THEANO_FLAGS=blas.ldflags="-L/usr/local/Cellar/openblas/0.2.18_2/lib/ -lblas",floatX=float32 python'

# NOTE: I had earlier installed brew python instead of system python. The brew
# python lives in /usr/local/bin/python. The site packages for brew python live
# in /usr/local/lib/python2.7/site-packages.
alias anaconda_python='~/bin/anaconda/bin/python'
alias brew_python='/usr/local/bin/python'

alias run_http_server='python -m SimpleHTTPServer'

# We use virtualenv for brew python (opencv is installed using this)
source /usr/local/bin/virtualenvwrapper.sh

export DYLD_LIBRARY_PATH=/Users/mohit/Projects/OpenCV_Install/opencv/build/lib:$DYLD_LIBRARY_PATH

# $1 = type; 0 - both, 1 - tab, 2 - title
# rest = text
setTerminalText () {
    # echo works in bash & zsh
    local mode=$1 ; shift
    echo -ne "\033]$mode;$@\007"
}
stt_both  () { setTerminalText 0 $@; }
stt_tab   () { setTerminalText 1 $@; }
stt_title () { setTerminalText 2 $@; }

# Disable iterm2 from automatically changing window/tab title
DISABLE_AUTO_TITLE="true" 

export MUJOCO_PY_MJKEY_PATH=~/.mujoco/mjkey.txt
export MUJOCO_PY_MJPRO_PATH=~/.mujoco/mjpro150

export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda-8.0/lib64:/usr/local/cuda-8.0/extras/CUPTI/lib64"
export CUDA_HOME=/usr/local/cuda-8.0

mount_klab () {
    mkdir -p /Volumes/klab"$1" && sshfs -o allow_other,defer_permissions,IdentityFile=~/.ssh/id_rsa mohit@"$2":/ /Volumes/klab"$1"
}
f() { CUDA_VISIBLE_DEVICES="$1" python -m pdb; }
