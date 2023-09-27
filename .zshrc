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

# fuzzy finder things

alias fcd='cd $(find $HOME/github -maxdepth 1 -type d -print | fzf)'

bindkey '^ ' autosuggest-accept

# pnpm
export PNPM_HOME="/Users/nikfp/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
