# Bootstrap
export ZSH=$HOME/.oh-my-zsh

# ZSH_THEME="avit-improved"
ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ADD_NEWLINE="true"
SPACESHIP_CHAR_SYMBOL=" \uf0e7"
SPACESHIP_CHAR_PREFIX="\uf296"
SPACESHIP_CHAR_SUFFIX=(" ")
SPACESHIP_DIR_COLOR="purple"
SPACESHIP_CHAR_COLOR_SUCCESS="yellow"
SPACESHIP_PROMPT_DEFAULT_PREFIX=""
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="false"
SPACESHIP_USER_SHOW="false"
SPACESHIP_KUBECONTEXT_SHOW="false"

plugins=(
  git
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Settings
source ~/.bash_profile
source ~/.zprofile

source $(dirname $(gem which colorls))/tab_complete.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

