# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 24h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

##########################
##### Path
##########################

export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/usr/local/bin/
export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:$HOME/bin/
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.npm-global/bin
export PATH=$PATH:$HOME/.npm-global/node_modules/.bin
export NODE_PATH=$PATH:$HOME/.npm-global/
export GPG_TTY=$(tty)

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
if [ -d "$HOME/.vscode-server/" ]; then
	source "$HOME/.local/bin/code-server-integration"
fi

# fzf
#source /usr/share/fzf/completion.zsh
#source /usr/share/fzf/key-bindings.zsh


##########################
##### Aliases
##########################

alias asciicast2gif="docker run --rm -v $PWD:/data asciinema/asciicast2gif"
alias petname="docker run --rm fjolsvin/petname"
alias kubeconfig-switcher="source kubeconfig-switcher"
alias i3lock="/bin/bash -c \"i3lock\""


##########################
##### custom functions
##########################
cdf(){cd $(fuzzycd "$1")}

fim(){vim $(fuzzyvim "$1")}

# fixed commiting vim-fugitive
#gpg(){
#	if [ -n "$FUGITIVE" ]; then
#	  set -- --pinentry-mode loopback "$@"
#	fi
#	exec /usr/bin/gpg "$@"
#}

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


##########################
##### autocompletions
##########################

if type "kubectl" >/dev/null; then
    source <(kubectl completion zsh)
fi

if type "helm" >/dev/null; then
    source <(helm completion zsh)
fi

if type "argocd" >/dev/null; then
    source <(argocd completion zsh)
fi

if type "terraform" >/dev/null; then
	complete -o nospace -C /usr/bin/terraform terraform
fi

if type "containerlab" >/dev/null; then
	source <(containerlab completion zsh)
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -U +X bashcompinit && bashcompinit
