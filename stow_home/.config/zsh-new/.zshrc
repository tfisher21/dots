# ========================================
# History
# ========================================

HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# ========================================
# Shell Behavior
# ========================================

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT # sort file10 after file9

# asdf shims — must be prepended after /etc/zprofile's path_helper runs
# (in .zshrc, not .zshenv), or path_helper pushes /usr/bin ahead of it,
# letting macOS system binaries (e.g. /usr/bin/ruby) shadow asdf shims.
export PATH="$HOME/.asdf/shims:$HOME/.asdf/bin:$PATH"

# Initialize zoxide
eval "$(zoxide init zsh)"

# ========================================
# Completion
# ========================================

autoload -Uz compinit

# Initialize completion with cache metadata file
() {
  local zcompdump="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
  compinit -d "$zcompdump"
}

# Enable interactive completion menu selection
zstyle ':completion:*' menu select

# Make completion case-insensitive
# Example: "doc" can complete to "Documents"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # lowercase input matches upper and lower

# ========================================
# Fuzzy Finder
# ========================================

# macOS / Homebrew (Apple Silicon)
() {
  local fzf_shell="/opt/homebrew/opt/fzf/shell"
  if [[ -f "$fzf_shell/key-bindings.zsh" ]]; then
    source $fzf_shell/key-bindings.zsh
    source $fzf_shell/completion.zsh
  fi
}

# ========================================
# Modular Config FIles
# ========================================

source "$ZDOTDIR/fzf.zsh" # fzf configuration
source "$ZDOTDIR/aliases.zsh" # aliases
source "$ZDOTDIR/bindings.zsh" # custom keybinds
source "$ZDOTDIR/plugins.zsh" # plugins and plugin manager
source "$ZDOTDIR/prompt.zsh" # prompt/theme
