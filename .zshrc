export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export GEM_HOME="$HOME/.gem"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"
# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion.
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
#ZSH_CUSTOM=$ZSH/plugins
# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

bindkey '\t' autosuggest-accept
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
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias b="cd ../"
alias cod="cd ~/code"
alias ll="ls -lha"
alias s="/usr/local/bin/sublime"
alias a="/usr/local/bin/atom"
alias rspec="nocorrect rspec"
alias c="make shell-console"
alias s="make dev"
alias r="bundle exec rspec spec"
alias dr="docker-compose run rspec"
alias m="bundle exec rake db:migrate"
alias ar="cd ~/code/ascent-rails/"
alias can="cd ~/code/canonical_data_service/"
alias k="kill -9"
alias es="~/code/es/elasticsearch-6.7.2/bin/./elasticsearch"
alias dc="docker-compose"
alias dcb="docker-compose build"
alias dcu="docker-compose up -d"
alias dcl="docker-compose logs -f"
alias dce="docker-compose exec"
alias dp="docker pause $docker_container_names"
alias ds="docker stop $docker_container_names"
alias rd="killall Docker && open /Applications/Docker.app"
alias gm="git checkout main && git pull"
alias dps="docker ps"
alias sw="make shell-web"
alias st="make shell-web-test"
alias rdot="systemctl restart dotfiles.service"
alias skill="spin destroy --all"
alias ldot="journalctl --unit dotfiles.service"
alias bh="spin up Shopify/bloodhound"
function docker-compose ()
{
  docker compose $@
}
function gn ()
{
  git checkout -b feature/knowfeat-$1
}
function go ()
{
  git checkout feature/knowfeat-$1
}
#function s ()
#{
#    if [ "$PWD" == "~/code/canonical_data_service" ]; then
#       make dev
#    elif [ "$PWD" == "~/code/ascent-rails" ]; then
#       make dev-up
#    fi;
#}
#function c ()
#{
#    if [ "$PWD" == "~/code/canonical_data_service" ]; then
#       make shell-console
#    elif [ "$PWD" == "~/code/ascent-rails" ]; then
#       make rails-console
#    fi;
#}
function t ()
{
    if [ "$PWD" == "~/code/canonical_data_service" ]; then
       make shell-web-test
    elif [ "$PWD" == "~/code/ascent-rails" ]; then
       make shell-rails-test
    fi;
}


function check_dps() {
  dps_output_length=$(dps | wc -l | xargs)
}
function restart_docker() {
  check_dps
  if [ $dps_output_length = 1 ]
  then
    rd
    echo "restarting docker and freeing your memory"
  else
    echo "stop docker processes before trying to kill docker"
    return 1
  fi
}
function kill_docker() {
  check_dps
  if [ $dps_output_length = 1 ]
  then
    killall Docker
    echo "killing docker and freeing your memory"
  else
    echo "stop docker processes before trying to kill docker"
    return 1
  fi
}

export PATH="/usr/local/sbin:$PATH"
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

