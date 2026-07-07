typeset -U path PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

# PostgreSQL (pin to 15 explicitly — postgresql@16 is also installed and
# could get force-linked later, which would silently change `psql`'s version)
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# JAVA_HOME
. "$HOME/.asdf/plugins/java/set-java-home.zsh"

# Molecule Specific Run Commands
source ~/.moleculerc
export PATH=$PATH:$HOME/Projects/wearemolecule/kubernetes-molecule/bin
export KUBEDIR=$HOME/Projects/wearemolecule/kubernetes-molecule
export KOPS_STATE_STORE=s3://molecule-kops-config
