#!/usr/bin/env bash

dotfiles_install_required_packeges() {
    apt-get install -y autoconf \
                         zsh
    #                    bison \
    #                    build-essential \
    #                    libssl-dev \
    #                    libyaml-dev \
    #                    libreadline6-dev \
    #                    zlib1g-dev \
    #                    libncurses5-dev \
    #                    libffi-dev \
    #                    libgdbm6 \
    #                    libgdbm-dev \
    #                    libdb-dev \
    #                    gpg \
    #                    tmux \
    #                    xclip

}

dotfiles_install_asdf() {
    # echo "Checking if 'asdf' is already installed..."
    if [[ ! -d ~/.asdf ]]; then
        echo "Installing 'asdf'..."
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
    else
        echo "'asdf' is already install... skipping"
        return 0
    fi
}

dotfiles_install_gems() {
  gem install solargraph rubocop neovim
	gem install rubocop-rspec rubocop-rails rubocop-performance rubocop-rake
	gem install sorbet sorbet-runtime
	gem install haml_lint slim_lint
	gem install brakeman reek
}

dotfiles_install_npm() {
	npm install -g prettier eslint babel-eslint eslint-plugin-import eslint-plugin-node
	npx install-peerdeps -g eslint-config-airbnb
	npm install -g stylelint stylelint-config-recommended stylelint-config-standard
	npm install -g yaml-language-server markdownlint
}

dotfiles_install_oh_my_zsh() {
  echo "Installing 'zsh'..."
  # Check if oh-my-zsh is installed
  OMZDIR="$HOME/.oh-my-zsh"
  # rm -rf $OMZDIR
  if [ ! -d "$OMZDIR" ]; then
    echo 'Installing oh-my-zsh'
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  else
    # echo 'Updating oh-my-zsh'
    # upgrade_oh_my_zsh
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
