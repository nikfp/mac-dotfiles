export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

if [ $OS_THEME = "Light" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/.omp/narrow-stacked-light.json)"
else
  eval "$(oh-my-posh init zsh --config ~/.config/.omp/narrow-stacked.json)"
fi

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias v='nvim'

alias vconf='cd ~/.config/nvim && nvim .'

alias github='cd ~/github/'

alias mixserv='iex -S mix phx.server'

# fuzzy finder things

alias fcd='cd $(find $PWD -maxdepth 1 -type d -print | fzf)'
alias fpr='cd $(find $HOME/github -maxdepth 1 -type d -print | fzf)'
tpr() {
  local searchdir
  searchdir=$(find $HOME/github -maxdepth 1 -type d -print | fzf)

  local basefile
  basefile=$(basename "$searchdir")

  if tmux ls 2>/dev/null; then
    local tmuxls=$(tmux ls 2>/dev/null)
    if echo tmuxls | grep -q "^$basefile:"; then
      echo "Session exists"
      if [ -n "$TMUX" ]; then
        tmux switch-client -t "$basefile"
      else
        tmux a -t "$basefile"
      fi
    else
      tmux new -d -s "$basefile" -c "$searchdir" 
      if [ -n "$TMUX" ]; then
        tmux switch-client -t "$basefile"
      else
        tmux a -t "$basefile"
      fi
    fi
  else
    tmux new -s "$basefile" -c "$searchdir"
  fi
}

bindkey '^ ' autosuggest-accept

# pnpm
export PNPM_HOME="/Users/nikfp/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

. "$HOME/.asdf/asdf.sh"

export OPENAI_API_KEY="thisisafakekey"

elixir_watch() {
  if [[ $# -ne 2 ]]; then
    echo "Usage: elixir_watch <directory_to_watch> <elixir_script.exs>"
    return 1
  fi

  watch_dir="$1"
  elixir_script="$2"

  if [[ ! -d "$watch_dir" ]]; then
    echo "Error: Directory '$watch_dir' does not exist."
    return 1
  fi

  if [[ ! -f "$elixir_script" ]]; then
    echo "Error: Elixir script '$elixir_script' does not exist."
    return 1
  fi

  echo "Watching directory: $watch_dir"
  echo "Elixir script to run: $elixir_script"

  fswatch -o "$watch_dir" | while read -r file; do
    echo "File changed: $file"
    elixir "$elixir_script"
  done
}

elixir_test() {
  local watch_dir="$(pwd)"

  echo "Watching directory: $watch_dir"
  echo "Running 'mix test' when files change..."

  fswatch -o "$watch_dir" | while read -r file; do
    echo "File changed: $file"
    mix test
  done
}

# Docker compose needs an alias

alias dc='docker-compose'

eval "$(direnv hook zsh)"


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/nikfp/.cache/lm-studio/bin"
