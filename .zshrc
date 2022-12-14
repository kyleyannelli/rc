EDITOR="vim"
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "popstas/zsh-command-time"
zplug "agkozak/zsh-z"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

#END ZPLUG
#
#
#START ALIAS

alias ll="ls -alF"
alias zrc="$EDITOR ~/.zshrc"
alias rfsh="exec zsh"
alias erc="$EDITOR ~/.${EDITOR}rc"

# END ALIAS
#
clear
echo "loaded custom zshrc :)"
#
# START EXPORTS
