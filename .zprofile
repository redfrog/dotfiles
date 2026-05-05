# =============================================================================
# .zprofile — Loaded ONCE at login, BEFORE .zshrc
# Put PATH setup and one-time tool initialization here.
# Do NOT put aliases / prompt / completion settings here (use .zshrc).
# =============================================================================

# -----------------------------------------------------------------------------
# Load shared environment variables
# (Aliases & functions are loaded from .zshrc, since they require an
#  interactive shell to be useful.)
# -----------------------------------------------------------------------------
[ -r "$HOME/.exports" ] && source "$HOME/.exports"

# -----------------------------------------------------------------------------
# PATH — system & language toolchains
# Order matters: later entries take precedence (they are prepended).
# -----------------------------------------------------------------------------

# Homebrew / system local
export PATH="/usr/local/bin:$PATH"

# OpenSSL (Homebrew)
export PATH="/usr/local/opt/openssl/bin:$PATH"

# Rust (cargo)
[ -r "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Rokit (Roblox toolchain manager)
[ -r "$HOME/.rokit/env" ] && . "$HOME/.rokit/env"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# proto (toolchain manager)
export PROTO_HOME="$HOME/.proto"
export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH"

# Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

# npm global bin (only resolve once at login to avoid slow shell startup)
if command -v npm >/dev/null 2>&1; then
  export PATH="$(npm config get prefix)/bin:$PATH"
fi

# -----------------------------------------------------------------------------
# Version managers
# -----------------------------------------------------------------------------

# asdf
[ -r "$HOME/.asdf/asdf.sh" ] && . "$HOME/.asdf/asdf.sh"

# -----------------------------------------------------------------------------
# Secrets — load from a file that is NOT committed to git
# (Create ~/.secrets with chmod 600 and put sensitive env vars there.)
# -----------------------------------------------------------------------------
[ -r "$HOME/.secrets" ] && source "$HOME/.secrets"
