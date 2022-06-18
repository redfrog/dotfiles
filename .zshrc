# homebrew
#typeset -U path PATH
#path=(
#  /opt/homebrew/bin(N-/)
#  /opt/homebrew/sbin(N-/)
#  /usr/bin
#  /usr/sbin
#  /bin
#  /sbin
#  /usr/local/bin(N-/)
#  /usr/local/sbin(N-/)
#  /Library/Apple/usr/bin
#)

# homebrew
export PATH=/opt/homebrew/bin:$PATH

source ~/.zshrc.antigen

# export PATH="$HOME/.run/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/redfrog/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/redfrog/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/redfrog/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/redfrog/google-cloud-sdk/completion.zsh.inc'; fi

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"