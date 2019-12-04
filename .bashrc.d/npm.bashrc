# Add clean-install command
npm() {
  if [[ $@ == "clean-install" ]]; then
    command npm install && git checkout package-lock.json
  else
    command npm "$@"
  fi
}
