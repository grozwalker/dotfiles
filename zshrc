# Functions
source ~/.shell/functions.sh

# Allow local customizations in the ~/.shell_local_before file
if [ -f ~/.shell_local_before ]; then
    source ~/.shell_local_before
fi

# Allow local customizations in the ~/.zshrc_local_before file
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

# External plugins (initialized before)
source ~/.zsh/plugins_before.zsh

# Settings
source ~/.zsh/settings.zsh

# Bootstrap
source ~/.shell/bootstrap.sh

# External settings
source ~/.shell/external.sh

# Aliases
source ~/.shell/aliases.sh

# Custom prompt
source ~/.zsh/prompt.zsh

# External plugins (initialized after)
source ~/.zsh/plugins_after.zsh

source ~/.autoenv/activate.sh

# Allow local customizations in the ~/.shell_local_after file
if [ -f ~/.shell_local_after ]; then
    source ~/.shell_local_after
fi

# Allow local customizations in the ~/.zshrc_local_after file
if [ -f ~/.zshrc_local_after ]; then
    source ~/.zshrc_local_after
fi

# source ~/.dotfiles/lib/zsh-autoenv/autoenv.zsh

. $HOME/.asdf/asdf.sh

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/root/yandex-cloud/path.bash.inc' ]; then source '/root/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/root/yandex-cloud/completion.zsh.inc' ]; then source '/root/yandex-cloud/completion.zsh.inc'; fi
