# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##########################
##### Path
##########################
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/usr/local/bin/
export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:$HOME/bin/

##########################
##### ENV Vars
##########################
export DEFAULT_USER=$USER
export TERM="xterm-256color"

##########################
##### Keybindings
##########################
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^g "lazygit\n"
bindkey -s ^v "source machvenv\n"

##########################
##### Extra sources
##########################
# dotfile submodules
source "$HOME/.local/bin/source-additional-files"

# vs code
source "$HOME/.local/bin/code-server-integration"

# fzf
#source /usr/share/fzf/completion.zsh
#source /usr/share/fzf/key-bindings.zsh

##########################
##### Aliases
##########################

##########################
##### custom functions
##########################
cdf(){cd $(fuzzycd "$1")}

fim(){vim $(fuzzyvim "$1")}

##########################
##### zsh stuff
##########################

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    history-substring-search
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
    vscode
    docker
    jsontools
    dotenv
)

source $ZSH/oh-my-zsh.sh

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# kubectl
if type "kubectl" >/dev/null; then
    source <(kubectl completion zsh)
fi

# helm
if type "helm" >/dev/null; then
    source <(helm completion zsh)
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
