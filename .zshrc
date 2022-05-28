# 
typeset -U path PATH
path=(
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /Library/Apple/usr/bin
)

# zsh path
source ~/.antigen/antigen.zsh

antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen use oh-my-zsh
antigen bundle --loc=plugins/ssh-agent/ssh-agent.plugin.zsh

# Theme
# powerlevel9k
# https://github.com/bhilburn/powerlevel9k
# POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
# antigen theme bhilburn/powerlevel9k powerlevel9k

# Theme
# https://github.com/robbyrussell/oh-my-zsh/wiki/themes
antigen theme agnoster
antigen apply

export PATH="$HOME/.run/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/redfrog/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/redfrog/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/redfrog/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/redfrog/google-cloud-sdk/completion.zsh.inc'; fi

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"