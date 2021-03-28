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

# dotfiles_install_asdf() {
#     # echo "Checking if 'asdf' is already installed..."
#     if [[ ! -d ~/.asdf ]]; then
#         echo "Installing 'asdf'..."
#         git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
#     else
#         echo "'asdf' is already install... skipping"
#         return 0
#     fi
# }

# dotfiles_install_gems() {
#   # gem install solargraph rubocop neovim
# 	# gem install rubocop-rspec rubocop-rails rubocop-performance rubocop-rake
# 	# gem install sorbet sorbet-runtime
# 	# gem install haml_lint slim_lint
# 	# gem install brakeman reek
# }

# dotfiles_install_npm() {
# 	# npm install -g prettier eslint babel-eslint eslint-plugin-import eslint-plugin-node
# 	# npx install-peerdeps -g eslint-config-airbnb
# 	# npm install -g stylelint stylelint-config-recommended stylelint-config-standard
# 	# npm install -g yaml-language-server markdownlint
# }

dotfiles_install_oh_my_zsh() {
  # echo "Installing 'zsh'..."
  # Check if oh-my-zsh is installed
  OMZDIR="$HOME/.oh-my-zsh"
  if [ ! -d "$OMZDIR" ]; then
    # echo 'Installing oh-my-zsh'
    /bin/sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  else
    # echo 'Updating oh-my-zsh'
    upgrade_oh_my_zsh
  fi
}

dotfiles_change_shell() {
  # # Change default shell
  if [! $0 = "-zsh"]; then
    echo 'Changing default shell to zsh'
    chsh -s /bin/zsh
  else
    echo 'Already using zsh'
  fi
}
