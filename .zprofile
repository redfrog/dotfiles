# =============================================================================
# .zprofile — Loaded ONCE at login, BEFORE .zshrc
# Put PATH setup and one-time tool initialization here.
# =============================================================================

# -----------------------------------------------------------------------------
# Homebrew (Apple Silicon: /opt/homebrew, Intel: /usr/local)
# Sets PATH, MANPATH, INFOPATH, HOMEBREW_* env vars in one shot.
# -----------------------------------------------------------------------------
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# -----------------------------------------------------------------------------
# Load shared environment variables (paths, ZSH var, etc.)
# -----------------------------------------------------------------------------
[ -r "$HOME/.exports" ] && source "$HOME/.exports"

# -----------------------------------------------------------------------------
# Toolchains — Rust / Bun / proto
# -----------------------------------------------------------------------------

# Rust (cargo)
[ -r "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Rokit (Roblox toolchain manager)
[ -r "$HOME/.rokit/env" ] && . "$HOME/.rokit/env"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# proto (manages node, npm, etc. — see ~/.proto/.prototools)
export PROTO_HOME="$HOME/.proto"
export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH"

# -----------------------------------------------------------------------------
# asdf (manages bats, shellcheck, shfmt — see ~/.asdf/.tool-versions)
# -----------------------------------------------------------------------------
[ -r "$HOME/.asdf/asdf.sh" ] && . "$HOME/.asdf/asdf.sh"

# -----------------------------------------------------------------------------
# Secrets — sensitive env vars (NOT committed to git)
# Create ~/.secrets with chmod 600 and put API keys / passphrases there.
# -----------------------------------------------------------------------------
[ -r "$HOME/.secrets" ] && source "$HOME/.secrets"
