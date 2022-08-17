# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##########################
##### SSH-Agent
##########################

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

setopt EXTENDED_HISTORY
setopt HIST_VERIFY
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Dont record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Dont record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Dont write duplicate entries in the history file.

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

scan-git-secrets() {
	echo "Scanning $PWD for secrets"
	docker run -v "$PWD":/path ghcr.io/zricethezav/gitleaks:v8.8.12 detect -f json -r "/path/report-secrets.json" --source="/path"
	cat report-secrets.json | jq -n -r 'inputs[].Secret' | sort -u > extracted-secrets
	echo "Exported $(wc -l extracted-secrets) to file ./extracted-secrets"
}

setup(){
	cd ~/dev/setup
	source .venv/bin/activate
	make $@ && deactivate
}

tf-docs(){
	if [ -z "$1" ]; then
		echo "output file missing"
	else;
		docker run --rm -v $(pwd):/project -w /project quay.io/terraform-docs/terraform-docs:latest --hide requirements markdown . > ./$1
	fi
}

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
    # zsh-completions
    docker
    dotenv
)

fpath+=~/.zsh
fpath+="${ZSH_CUSTOM:-"$ZSH/custom"}/plugins/zsh-completions/src"
source "$ZSH/oh-my-zsh.sh"
# autoload -U compinit && compinit
# autoload -U +X bashcompinit && bashcompinit
zstyle ':completion:*' menu select

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

if type "argo" >/dev/null; then
    source <(argo completion zsh)
fi

if type "terraform" >/dev/null; then
	complete -o nospace -C /usr/bin/terraform terraform
fi

if type "containerlab" >/dev/null; then
	source <(containerlab completion zsh)
fi

if type "kaf" >/dev/null; then
	source <(kaf completion zsh)
fi

if type "kafkactl" >/dev/null; then
	source <(kafkactl completion zsh)
fi

if type "rustup" >/dev/null; then
	rustup completions zsh > ~/.zsh/rustup-completion.zsh
	# source <(rustup completions zsh)
fi

if type "gh" >/dev/null; then
	source <(gh completion -s zsh)
fi

if type "glab" >/dev/null; then
	source <(glab completion -s zsh)
fi

if [ -f "/usr/share/nvm/init-nvm.sh" ]; then
	source "/usr/share/nvm/init-nvm.sh"
fi

if type "vault" >/dev/null; then
	complete -o nospace -C /usr/bin/vault vault
fi

# fzf
if [ -f "/usr/share/fzf/completion.zsh" ]; then
	source /usr/share/fzf/completion.zsh
fi

if [ -f "/usr/share/fzf/key-bindings.zsh" ]; then
	source /usr/share/fzf/key-bindings.zsh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
