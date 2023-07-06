####################################################################################################
#                     Colors and text formatting
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;36m'
PLAIN='\033[0m'
bold=$(tput bold)
normal=$(tput sgr0)
####################################################################################################





####################################################################################################
######                ZNAP
####################################################################################################
# ZNAP is a package manager for zsh: https://github.com/marlonrichert/zsh-snap
# Download Znap, if it's not there yet.
[[ -r /Users/balazsfodorpap/.oh-my-zsh/custom/plugins/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git /Users/balazsfodorpap/.oh-my-zsh/custom/plugins/znap
source /Users/balazsfodorpap/.oh-my-zsh/custom/plugins/znap/znap.zsh  # Start Znap

####################################################################################################





####################################################################################################
#                     PLUGINS

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"

# Would you like to use another custom folder than $ZSH/custom?
#ZSH_CUSTOM=~/zsh/

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
         git
         kubectl
         zsh-syntax-highlighting
         zsh-autosuggestions
         zsh-autocomplete
         fzf-zsh-plugin
         fzf-tab
)

source $ZSH/oh-my-zsh.sh

source /Users/balazsfodorpap/.oh-my-zsh/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

####################################################################################################





####################################################################################################
######                Own aliases starts here
####################################################################################################
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# General
alias zshconfig="code ~/.zshrc"
alias cdm2="cd ~/.m2"
alias topmem="top -omem -s 2 -n 5"
alias topcpu="top -ocpu -s 2 -n 5"
alias cl="clear"

# Git related
alias gitupdate='git fetch;git pull'
alias gitdevelop='git checkout develop;gitupdate'
alias gitmain='git checkout main;gitupdate'
alias gitmaster='git checkout master;gitupdate'

# Kafka related
# make sure that the path is correct and scripts are there
alias kstart='sh $HOME/Documents/kafka/kafka-docker/start.sh'
alias kstop='sh $HOME/Documents/kafka/kafka-docker/stop.sh'

# Docker & Kubernetes related
alias dockerip='docker ps | tail -n +2 | while read cid b; do echo -n "$cid\t"; docker inspect $cid | grep IPAddress | cut -d \" -f 4; done'
alias kx='kubectx'
alias kntnieuw='kubectx aota070.avinty.cloud && kubens tnieuw '
alias knonieuw='kubectx aota070.avinty.cloud && kubens onieuw '
alias knthuidig='kubectx aota070.avinty.cloud && kubens thuidig '
alias kntvorig='kubectx aota070.avinty.cloud && kubens tvorig '
alias kn='kubens'
alias kc='echo ${BLUE}$(kubectx -c) : ${YELLOW}$(kubens -c)${PLAIN}'
alias kfns='sh $HOME/Documents/personal/repositories/stuffs/computer-setup/scripts/kubernetes/kfns.sh'
alias kgi="kc && kubectl get deployments -o=json | jq -r '.items[].spec.template.spec.containers[].image'"
alias klogs='kubectl logs'

# project related
alias cdstuffs='cd $HOME/Documents/personal/repositories/stuffs'
alias cdclient='cd $HOME/Documents/repositories/epd/client'
alias cdcare='cd $HOME/Documents/repositories/epd/care'
alias cdjur='cd $HOME/Documents/repositories/epd/juridical'
alias cdjuridical='cdjur'
alias cdmain='cd $HOME/Documents/repositories/epd/main'
alias cdbil='cd $HOME/Documents/repositories/epd/billing'
alias cdbilling='cdbil'

# intelliJ IDEA related
alias istuffs='cdstuffs && idea .'
alias iclient='cdclient && idea .'
alias icare='cdcare && idea .'
alias ijuridical='cdjuridical && idea .'
alias ijur='ijuridical'
alias ibilling='cdbilling && idea .'
alias ibil='ibilling'
alias imain='cdmain && idea .'

# fzf related
alias fzfcd='cd $(find * -type d | fzf)'
alias rgfzf='rg . | fzf'

####################################################################################################

export PATH="/usr/local/opt/openjdk@8/bin:$PATH"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

export HISTFILESIZE=100000 # maximum number of lines that we can write back to the history file on disk.
export HISTSIZE=100000 # maximum number of lines of history that we can store in memory

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /Users/balazsfodorpap/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Default text editor
export EDITOR="/Applications/Visual Studio Code.app/Contents/MacOS/Electron"

####################################################################################################




####################################################################################################
#                   HOMEBREW - BREWFILE

# Location of Brewfile
export HOMEBREW_BREWFILE=$HOME/Documents/personal/repositories/stuffs/computer-setup/brew/.brewfile

# Wrap brew command to for an automatic update of Brewfile when you execute such a brew install or brew uninstall.
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

####################################################################################################





####################################################################################################
#                     KUBERNETES

# set up autocomplete
#[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# location of the kubeconfig (avinty)
export KUBECONFIG=/Users/balazsfodorpap/Documents/configs/kube-avinty-config.conf

####################################################################################################





####################################################################################################
#                     FZF

# !!! Make sure you add fzf-zsh-plugin
# Cheatsheets: https://andrew-quinn.me/fzf/

# to limit fzf to the current directory
# https://github.com/junegunn/fzf/issues/980
# export FZF_DEFAULT_COMMAND="find . -maxdepth 5 | sed 's/^..//'"

# first "tab" press bring the fzf selection list and then the second tab just select the currently selected option(s) instead of enter (enter is still working)
# zstyle ':fzf-tab:*' fzf-bindings 'tab:accept'
export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_OPTS="--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b"


export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}' --bind='enter:become(code {1})'"

export FZF_CTRL_R_OPTS='--bind=enter:become({1})'


####################################################################################################




####################################################################################################
#                     UNUSED

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

####################################################################################################
