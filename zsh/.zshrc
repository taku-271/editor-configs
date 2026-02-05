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

# cd した後に ls するように
function chpwd() {
  ls -a --color
}

# docker-nvimの設定
function dnvim() {
  local target_path
  target_path=$(pwd)

  local config_dir="$HOME/Documents/dotfiles/nvim/docker"

  TARGET_PATH="$target_path" docker compose \
    -f "$config_dir/docker-compose.yaml" \
    -p "nvim-env" \
    run \
    --service-ports \
    --rm nvim
}

