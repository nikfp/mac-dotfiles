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
