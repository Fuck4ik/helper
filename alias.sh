#!/bin/bash

GIST_URL="https://gist.githubusercontent.com/Fuck4ik/f0a0c6f9b19b2c0a4cfcc42fb02bf7e1/raw/f120335f8f440179aaaf111878a9fd2a75f7a444/bashrc_helper.sh"

install_aliases() {
  echo "Installing aliases and functions..."
  curl -s $GIST_URL -o ~/.omasn_bash_helper
  if ! grep -q "source ~/.omasn_bash_helper" ~/.bashrc; then
    echo "source ~/.omasn_bash_helper" >> ~/.bashrc
  fi
  source ~/.bashrc
  echo "Aliases and functions installed successfully."
}

update_aliases() {
  echo "Updating aliases and functions..."
  curl -s $GIST_URL -o ~/.omasn_bash_helper
  source ~/.bashrc
  echo "Aliases and functions updated successfully."
}

remove_aliases() {
  echo "Removing aliases and functions..."
  sed -i '/source ~\/.omasn_bash_helper/d' ~/.bashrc
  rm -f ~/.omasn_bash_helper
  source ~/.bashrc
  echo "Aliases and functions removed successfully."
}

case "$1" in
  install)
    install_aliases
    ;;
  update)
    update_aliases
    ;;
  remove)
    remove_aliases
    ;;
  *)
    echo "Usage: $0 {install|update|remove}"
    ;;
esac
