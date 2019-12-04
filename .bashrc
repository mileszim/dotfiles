# user@host /current/dir (branch *) $
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '

## Load .bashrc files
## Uncomment as needed
# source ~/.bashrc.d/go.bashrc
# source ~/.bashrc.d/nvm.bashrc
# source ~/.bashrc.d/postgres.bashrc
# source ~/.bashrc.d/pyenv.bashrc
# source ~/.bashrc.d/rvm.bashrc
# source ~/.bashrc.d/npm.bashrc

# Load misc scripts
export PATH="$PATH:$HOME/.git-scripts"
export PATH="$PATH:$HOME/.localbin"
