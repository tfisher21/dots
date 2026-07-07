# ========================================
# File Listing Replacement
# ========================================

alias ls='eza --icons' # better ls
alias ll='eza -lh --icons --git' # detailed listing
alias la='eza -lah --icons --git' # detailed listing including hidden files

alias tree='eza --tree --icons' # tree view

compdef eza=ls # reuse ls completions for eza (avoids defining a separate completion function)

alias cat='bat' # better cat

# ========================================
# Core Utilities
# ========================================

alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'
