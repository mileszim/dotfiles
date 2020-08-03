_aws-vault_bash_autocomplete() {
    local i cur prev opts base

    for (( i=1; i < COMP_CWORD; i++ )); do
        if [[ ${COMP_WORDS[i]} == -- ]]; then
            _command_offset $i+1
            return
        fi
    done

    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts=$( ${COMP_WORDS[0]} --completion-bash "${COMP_WORDS[@]:1:$COMP_CWORD}" )
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _aws-vault_bash_autocomplete -o default aws-vault

_aws_ps1() {
  aws_env=$(ps -Ao command | grep -E "aws-vault exec (?:-s|--server)" | grep -v grep  | awk '{print $4}')
  if [[ ! -z "${aws_env}"  ]]; then
    echo "[aws:${aws_env}] "
  fi
}

_kill_aws_vault() {
  aws_vault_server_pid=$(ps -Ao pid,command | grep -E "aws-vault exec (?:-s|--server)" | grep -v grep | awk '{print $1}')
  command kill -9 $aws_vault_server_pid
}

aws-vault() {
  if [[ $1 == "start" ]]; then
    command aws-vault exec -s $2
  elif [[ $1 == "stop" ]]; then
    command aws-vault remove -s $2
  else
    command aws-vault "$@"
  fi
}

export PS1="\$(_aws_ps1)$PS1"
