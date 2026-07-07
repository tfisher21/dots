typeset -U path PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

# Molecule Specific Run Commands
source ~/.moleculerc
export PATH=$PATH:$HOME/Projects/wearemolecule/kubernetes-molecule/bin
export KUBEDIR=$HOME/Projects/wearemolecule/kubernetes-molecule
export KOPS_STATE_STORE=s3://molecule-kops-config

# PostgreSQL
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# JAVA_HOME
. ~/.asdf/plugins/java/set-java-home.zsh
