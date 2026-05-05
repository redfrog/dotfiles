for file in ~/.{exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" -a -x "$(command -v powerline-shell)" ]; then
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

# asdf
. "$HOME/.asdf/asdf.sh"
export PATH=/usr/local/bin:$PATH

# proto
export PROTO_HOME="$HOME/.proto";
export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH";
echo 'export PATH="$(npm config get prefix)/bin:$PATH"' >> ~/.zshrc

# proto shell activation
if command -v proto >/dev/null 2>&1; then
  eval "$(proto activate bash)"
fi

# anthropic: claude code client key passphrase 
export CLAUDE_CODE_CLIENT_KEY_PASSPHRASE="ECgvEiM_smv4vfvH"