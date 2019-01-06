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
