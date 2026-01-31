# ssh-agentの設定
if [ -z "$SSH_AUTH_SOCK" ]; then
   RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
   if [ "$RUNNING_AGENT" = "0" ]; then
        ssh-agent -s &> $HOME/.ssh/ssh-agent
   fi
   eval `cat $HOME/.ssh/ssh-agent`
fi
ssh-add $HOME/.ssh/github_rsa

eval "$(/opt/homebrew/bin/brew shellenv)"

# nvimのエイリアス設定
alias n="nvim"

# starshipの設定
eval "$(starship init zsh)"

