# user@host /current/dir (branch *) $
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '

# NVM
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

# PyENV
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi
#
# export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

# Postgres.app
# export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.6/bin"

export PATH="$PATH:$HOME/.git-scripts"
export PATH="$PATH:$HOME/.localbin"

# For when you MUST deal with NPM package lock bs
npm() {
  if [[ $@ == "clean-install" ]]; then
    command npm install && git checkout package-lock.json && git checkout client/package-lock.json
  else
    command npm "$@"
  fi
}
