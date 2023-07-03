# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;36m'
PLAIN='\033[0m'
bold=$(tput bold)
normal=$(tput sgr0)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/balazsfodorpap/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# some notes about kube-ps1:
#   currently it's not working with oh-my-zsh, https://github.com/jonmosco/kube-ps1/issues/168
plugins=(git kube-ps1 zsh-syntax-highlighting zsh-autosuggestions zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

###### Own aliases starts here

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
alias kstart='sh $HOME/Documents/kafka/kafka-docker/start.sh' # change the path to your kafka dir
alias kstop='sh $HOME/Documents/kafka/kafka-docker/stop.sh' # change the path to your kafka dir

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
alias imain='cdmain && idea .'

#fzf related
alias fzfcd='cd $(find . -type d -print | fzf)'

###### Own aliases ends here
export PATH="/usr/local/opt/openjdk@8/bin:$PATH"
export PATH="/usr/local/opt/openjdk@8/bin:$PATH"
export PATH="/usr/local/opt/openjdk@8/bin:$PATH"
export PATH="/usr/local/opt/openjdk@8/bin:$PATH"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

export HISTFILESIZE=100000
export HISTSIZE=100000

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Default text editor
export EDITOR="/Applications/Visual Studio Code.app/Contents/MacOS/Electron"

# Location of Brewfile
export HOMEBREW_BREWFILE=$HOME/Documents/personal/repositories/stuffs/computer-setup/brew/.brewfile

# Wrap brew command to for an automatic update of Brewfile when you execute such a brew install or brew uninstall.
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

# Kubernetes
[[ $commands[kubectl] ]] && source <(kubectl completion zsh) # set up autocomplete

export KUBECONFIG=/Users/balazsfodorpap/Documents/configs/kube-avinty-config.conf


# to limit fzf to the current directory
# https://github.com/junegunn/fzf/issues/980
export FZF_DEFAULT_COMMAND="find . -maxdepth 5 | sed 's/^..//'"
