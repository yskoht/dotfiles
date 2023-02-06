#!/bin/sh
function install() {
  plugin_name=$1
  version=$2

  echo "---- ${plugin_name}"
  asdf plugin add $plugin_name
  asdf install $plugin_name $version
  asdf set --home $plugin_name $version
  echo ''
}

install direnv latest
install fzf latest
install gcloud latest
install golang latest
install git latest
install nodejs latest
install java 'adoptopenjdk-19.0.2+7'
install python latest
RUBY_CONFIGURE_OPTS="--with-libyaml-dir=$(brew --prefix libyaml)" install ruby latest
install vim latest

