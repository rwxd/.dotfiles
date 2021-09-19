#
# ~/.bash_profile
#

SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export PATH=$HOME/local/bin:$PATH

additional_files=("$HOME/.config/personal/env")
for file in $additional_files; do
    if [ -f $file ]; then
		source $file
	fi
done

[[ -f ~/.bashrc ]] && . ~/.bashrc
