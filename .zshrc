export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git battery colored-man-pages command-not-found emacs fzf gh poetry pre-commit python rust ripgrep ssh-agent timer)

source $ZSH/oh-my-zsh.sh

export TERM=xterm-256color
export PATH=$PATH:~/.emacs.d/bin/:~/.local/bin
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
alias ls=exa
alias cat=bat
alias grep=rg

. "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)

autoload -Uz compinit && compinit
