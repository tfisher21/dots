# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Update automatically without asking
zstyle ':omz:update' mode auto

# zoxide oh-my-zsh plugin
# - note: must be set before the plugin init
export ZOXIDE_CMD_OVERRIDE="cd"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	aliases
	asdf
	git
	zoxide
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Molecule Specific Run Commands
source ~/.moleculerc

# ASDF Configuration
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
