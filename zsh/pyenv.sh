export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:${PATH}"
[ "`which pyenv`" != "" ] && eval "$(pyenv init -)"

#eval "$(pyenv virtualenv-init -)"
export PATH="/usr/local/Cellar/pyenv-virtualenv/1.1.3/shims:${PATH}";
export PYENV_VIRTUALENV_INIT=1;
_pyenv_virtualenv_hook() {
  local ret=$?
  if [ -n "$VIRTUAL_ENV" ]; then
    eval "$(pyenv sh-activate --quiet || pyenv sh-deactivate --quiet || true)" || true
  else
    eval "$(pyenv sh-activate --quiet || true)" || true
  fi
  return $ret
};
#if ! [[ "$PROMPT_COMMAND" =~ _pyenv_virtualenv_hook ]]; then
#  PROMPT_COMMAND="_pyenv_virtualenv_hook;$PROMPT_COMMAND";
#fi
