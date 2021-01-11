#!/usr/bin/env bash

dotfiles_install_required_packeges() {
    apt-get install -y autoconf \
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
                       libdb-dev

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
