export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

if [ $OS_THEME = "Light" ]; then
  echo "OS is in light mode"
  eval "$(oh-my-posh init zsh --config ~/.config/.omp/narrow-stacked-light.json)"
else
  eval "$(oh-my-posh init zsh --config ~/.config/.omp/narrow-stacked.json)"
  echo "OS is in dark mode"
fi

alias v='nvim'

alias vconf='cd ~/.config/nvim && nvim .'

alias github='cd ~/github/'

# set +e
# DARK=`defaults read -g AppleInterfaceStyle || true`
# set -e

# OS_THEME="Light"

# if [ $DARK = "Dark" ]; then
#   echo "OS is in dark mode"
#   OS_THEME="Dark"
# else
#   echo "OS is in light mode"
# fi

# export OS_THEME


