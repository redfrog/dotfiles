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

