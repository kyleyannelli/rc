if [ -z "$TMUX_PANE" ]; then
    tmux a || tmux new-session -s main -n main
fi
EDITOR="nvim"
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "popstas/zsh-command-time"
zplug "agkozak/zsh-z"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "felixr/docker-zsh-completion"

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

#END ZPLUG
#
#
#START ALIAS

alias ll="ls -alF"
alias zrc="$EDITOR ~/.zshrc"
alias rfsh="exec zsh"
alias erc="$EDITOR ~/.${EDITOR}rc"

export JAVA_HOME=/usr/local/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

export GOPATH="${HOME}/go"
PATH=$PATH:$GOPATH/bin


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="nobraun" # set by `omz`

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(git)

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
# >>> xmake >>>
test -f "${HOME}/.xmake/profile" && source "${HOME}/.xmake/profile"
# <<< xmake <<<
export VCPKG_ROOT=$(brew --prefix vcpkg)

export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="${HOME}/Scripts/tmux-zshz:$PATH"
alias vcpkg="${HOME}/vcpkg/vcpkg"
export VCPKG_ROOT="${HOME}/vcpkg"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"

autoload bashcompinit
bashcompinit

JAVA_HOME="/usr/local/opt/java/"

alias push-github="${HOME}/Scripts/push-to-github-interactive.zsh"
alias ll="ls -alFh"
alias vim-be-good="docker run -it --rm brandoncc/vim-be-good:latest"
alias cheat-sheet="~/Scripts/cht.sh"

source ~/Scripts/cd-random.sh
source ~/Scripts/dir

alias lazy-cpp='${HOME}.local/bin/kmfg/lazy-cpp/lazy-cpp.sh'
export CPP_LAZY_VERSION=0.3.0-beta

alias nproc="sysctl -n hw.logicalcpu"
alias multipass-shutdown="sudo launchctl bootout system /Library/LaunchDaemons/com.canonical.multipassd.plist"
alias adguard="sudo /Applications/AdGuardHome/AdGuardHome -s"
alias show-used-ports="netstat -an | grep LISTEN"
alias tailf="${HOME}/Scripts/tailf/tailf.sh"
alias cd-random="cd_random"
alias cdr="cd_random"
alias dual="${HOME}/Scripts/tmux-dual"
alias vim="nvim"
alias vi="nvim"
alias rmf="rm -rf"
alias cdr="cd_random"
alias cdrd="cd_random_clean"
alias ccat="/bin/cat"
alias cat="bat"
alias cdh="cd ~"
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

# Created by `pipx` on 2024-03-09 16:51:03
export PATH="$PATH:/Users/kyannelli/.local/bin"
