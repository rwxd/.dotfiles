# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export DEFAULT_USER=$USER
export TERM="xterm-256color"

export CHROME_EXECUTABLE=google-chrome-stable
export ANSIBLE_ROLES_PATH=$HOME/dev/ansible-roles/

export PATH=$PATH:/usr/local/bin/
export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:$HOME/bin/

# vscode server code executable
if ! type "code" >/dev/null ; then
    code_executable=$(find $HOME/.vscode-server/bin/ -executable -name "code" -quit -print0)
    if [ -f "$code_executable" ]; then
        PATH="$PATH:$code_executable"
    fi
fi

# source submodules
additional_zshrcs=("$HOME/.config/akq/.zshrc" "$HOME/.config/personal/.zshrc") 

for file in $additional_zshrcs; do
    if [ -f $file ]; then
        source $file
    fi
done

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

source <(kubectl completion zsh)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
