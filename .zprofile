for file in ~/.{exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done

function powerline_precmd() {
  PS1="$(~/.powerline-shell/powerline-shell.py $? --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
  install_powerline_precmd
fi

if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# lang
export LANG=ja_JP.UTF-8

# show japanese files
setopt print_eight_bit

# set comment as #
setopt interactive_comments

# openssl
export PATH="/usr/local/opt/openssl/bin:$PATH"
# ruby: openssl
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# nodenv
export NODENV_ROOT="$HOME/.nodenv"
export PATH="$NODENV_ROOT/bin:$PATH"
eval "$(nodenv init -)"

# rbenv
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# plenv
export PLENV_ROOT="$HOME/.plenv"
export PATH="$PLENV_ROOT/bin:$PATH"
eval "$(plenv init -)"

# gopath
#export GOPATH="$HOME/.go"
#export PATH=$PATH:$GOPATH/bin

# postgresql
#export PGDATA=/usr/local/var/postgres

# sqlite
#export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig"


# google-cloud-sdk
# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/redfrog/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/redfrog/google-cloud-sdk/path.zsh.inc'; fi

# google-cloud-sdk
# The next line enables shell command completion for gcloud.
#if [ -f '/Users/redfrog/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/redfrog/google-cloud-sdk/completion.zsh.inc'; fi
