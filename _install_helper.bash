#!/usr/bin/env bash

dotfiles_install_required_packages() {
    curl -sL https://deb.nodesource.com/setup_16.x | bash -

    apt update && apt install -yqq  autoconf \
                                    zsh \
                                    bison \
                                    build-essential \
                                    libssl-dev \
                                    libyaml-dev \
                                    libreadline6-dev \
                                    zlib1g-dev \
                                    libncurses5-dev \
                                    libffi-dev \
                                    libgdbm6 \
                                    libgdbm-dev \
                                    libdb-dev \
                                    nodejs \
                                    snapd \
                                    gpg \
                                    tmux \
                                    xclip

}

dotfiles_install_packages_for_cloud_development() {
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
    curl https://baltocdn.com/helm/signing.asc | apt-key add -
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com focal main"
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

    apt update && apt install -yqq  kubectl \
                                    helm \
                                    kubectl \
                                    google-cloud-sdk \
                                    google-cloud-sdk-gke-gcloud-auth-plugin \
                                    terraform

    snap install doctl
}

dotfiles_install_asdf() {
  echo "Checking if 'asdf' is already installed..."

  if [[ ! -d ~/.asdf ]]; then
    echo "Installing 'asdf'..."
    mkdir ~/.asdf
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
  else
    echo "'asdf' is already install... skipping"
    return 0
  fi
}

dotfiles_install_gems() {
  gem install solargraph rubocop neovim \
              rubocop-rspec rubocop-rails rubocop-performance rubocop-rake \
              sorbet sorbet-runtime \
              haml_lint slim_lint \
              brakeman reek
}

dotfiles_install_npm() {
	npm install -g  prettier eslint babel-eslint eslint-plugin-import eslint-plugin-node \
                  stylelint stylelint-config-recommended stylelint-config-standard \
                  yaml-language-server markdownlint

  npx install-peerdeps -g eslint-config-airbnb
}

dotfiles_install_oh_my_zsh() {
  echo "Installing 'zsh'..."

  OMZDIR="$HOME/.oh-my-zsh"
  if [ ! -d "$OMZDIR" ]; then
    echo 'Installing oh-my-zsh'
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  else
    echo 'Zsh already installed'
  fi
}

dotfiles_change_shell() {
  # Change default shell
  echo "Change default shell to 'zsh'..."

  if [ ! "$SHELL" = '/bin/zsh' ]; then
    echo 'Installing oh-my-zsh'
    chsh -s /bin/zsh
  else
    echo 'Zsh already default'
  fi
}

dotfiles_install_plugins() {
  # Install zsh plugins
  echo "Install zsh plugins"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

dotfiles_install_autoenv() {
  # Install zsh plugins
    AUTOENVDIR="$HOME/.autoenv"
  if [ ! -d "$AUTOENVDIR" ]; then
    echo "Install autoenv"
    git clone git://github.com/inishchith/autoenv.git $AUTOENVDIR
  else
    echo 'Autoenv installed'
  fi
}
