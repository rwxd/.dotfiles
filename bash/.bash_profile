#
# ~/.bash_profile
#

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

export PATH=$HOME/local/bin:$PATH

# source submodules
source "$HOME/.local/bin/source-additional-files"

additional_files=("$HOME/.config/personal/env")
for file in $additional_files; do
    if [ -f $file ]; then
		source $file
	fi
done

[[ -f ~/.bashrc ]] && . ~/.bashrc
