# ========================================
# File Listing Replacement
# ========================================

# --icons takes an optional WHEN value, so a bare --icons swallows the first
# argument as its value ("ls somedir" -> invalid value 'somedir'). Always pin it.
alias ls='eza --icons=auto' # better ls
alias ll='eza -lh --icons=auto --git' # detailed listing
alias la='eza -lah --icons=auto --git' # detailed listing including hidden files

alias tree='eza --tree --icons=auto' # tree view

alias cat='bat' # better cat

# ========================================
# Core Utilities
# ========================================

alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'

# ========================================
# Claude
# ========================================

alias ca='claude agents'
