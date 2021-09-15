selected=`curl -s https://cht.sh/:list | grep "^\w*" | sort --unique | fzf`
read -p "Enter Query: " query

query=`echo $query | tr ' ' '+'`

if { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    curl -s cht.sh/$selected/$query | less
fi
