if [ -n "$TMUX" ]; then
    fzf_params="--reverse"
else
    fzf_params=""
fi

selected=`curl -s https://cht.sh/:list | grep "^\w*" | sort --unique | fzf $fzf_params`
read -p "Enter Query: " query

query=`echo $query | tr ' ' '+'`

if [ $query != "\n" ] ; then
  echo "if successful"
  query=$(echo "/"$query)
fi

if { [ -n "$TMUX" ]; } then
    tmux neww -n "$selected" bash -c "curl -s cht.sh/$selected$query | less"
else
    curl -s cht.sh/$selected$query | less
fi
