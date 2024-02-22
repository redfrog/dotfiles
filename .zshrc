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

# antigen
source ~/.zshrc.antigen

# pnpm
export PNPM_HOME="/Users/redfrog/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end