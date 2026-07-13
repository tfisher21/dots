export ZDOTDIR="$HOME/.config/zsh-new"

# asdf shims — .zshenv is sourced by every shell (interactive or not), unlike
# .zshrc, which non-interactive tool-spawned shells (e.g. Claude Code's Bash
# tool) skip. Without this here, those shells fall back to whatever
# /etc/zprofile's path_helper set, letting macOS system binaries (e.g.
# /usr/bin/ruby) shadow asdf. .zshrc re-applies this after path_helper for
# interactive shells; this covers non-interactive ones.
export PATH="$HOME/.asdf/shims:$HOME/.asdf/bin:$PATH"

. "$HOME/.cargo/env"
