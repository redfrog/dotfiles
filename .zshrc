# =============================================================================
# .zshrc — Loaded for INTERACTIVE shells, AFTER .zprofile
# Put plugins, prompt, completion, aliases, and key bindings here.
# Reference:
#   https://qiita.com/yasunori-kirin0418/items/3557150582a1f7e08ecb
#   https://qiita.com/shun198/items/c60ec1cce9c9bf1e8c26
# =============================================================================

# -----------------------------------------------------------------------------
# Powerlevel10k instant prompt
# Must stay near the top of .zshrc. Anything that prints to stdout/stderr
# (echo, print, slow tool init that warns, etc.) MUST come BEFORE this block.
# -----------------------------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Pick ONE: "quiet" suppresses the warning, "off" disables instant prompt.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# -----------------------------------------------------------------------------
# Plugin manager: zinit
# -----------------------------------------------------------------------------
if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod go-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

# zinit annexes (meta-plugins). zicompinit is called after all zinit plugins
# are loaded, so call it only ONCE here.
zi light-mode for \
  z-shell/z-a-meta-plugins \
  @annexes
zicompinit

# Project-local zinit plugin list
source "$HOME/.zshrc.zinit"

# -----------------------------------------------------------------------------
# Oh My Zsh
# Theme must be set BEFORE sourcing the OMZ config file.
# -----------------------------------------------------------------------------
ZSH_THEME="powerlevel10k/powerlevel10k"
source "$HOME/.zshrc.oh-my-zsh"

# Powerlevel10k user config (run `p10k configure` to (re)generate)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -----------------------------------------------------------------------------
# History
# -----------------------------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000          # In-memory history size
SAVEHIST=1000000         # On-disk history size

setopt inc_append_history     # Append commands to HISTFILE as they run
setopt share_history          # Share history across all running shells
setopt hist_ignore_all_dups   # Drop duplicates from history
setopt hist_save_no_dups      # When saving, drop the older duplicate
setopt extended_history       # Record timestamps in HISTFILE
setopt hist_expire_dups_first # When trimming, drop dups first

# -----------------------------------------------------------------------------
# Completion & colors
# (compinit is also triggered by zicompinit above; calling once more here
#  is safe and ensures completion works even if zinit init is skipped.)
# -----------------------------------------------------------------------------
autoload -Uz compinit && compinit
autoload -Uz colors   && colors

if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# -----------------------------------------------------------------------------
# Shell options (interactive UX)
# -----------------------------------------------------------------------------
setopt auto_param_slash      # Append "/" after a directory name on completion
setopt auto_param_keys       # Auto-complete matching brackets/quotes
setopt mark_dirs             # Append "/" to expanded directory names
setopt auto_menu             # Cycle completions on repeated TAB
setopt correct               # Suggest spelling corrections for commands
setopt interactive_comments  # Allow "#" comments in interactive shell
setopt magic_equal_subst     # Complete after "=" (e.g. --prefix=/usr)
setopt complete_in_word      # Complete from cursor position, not end of word
setopt print_eight_bit       # Display non-ASCII (e.g. Japanese) filenames
setopt auto_cd               # `dir` alone cd's into dir
setopt no_beep               # Disable audible bell

# -----------------------------------------------------------------------------
# Key bindings
# -----------------------------------------------------------------------------
# Ctrl-P / Ctrl-N: history search filtered by what's already typed
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end  history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# -----------------------------------------------------------------------------
# Aliases & user functions (interactive only)
# -----------------------------------------------------------------------------
for file in ~/.{aliases,functions}; do
  [ -r "$file" ] && source "$file"
done

# Quick aliases (keep here or move to ~/.aliases)
alias ls='ls --color=auto -G'
alias la='ls -lAG'
alias ll='ls -lG'
alias c='clear'
alias cc='c &&'

# -----------------------------------------------------------------------------
# Tool integrations (interactive)
# -----------------------------------------------------------------------------

# bun completions
[ -s "$HOME/.oh-my-zsh/completions/_bun" ] && source "$HOME/.oh-my-zsh/completions/_bun"

# proto — activate for zsh (NOT bash)
if command -v proto >/dev/null 2>&1; then
  eval "$(proto activate zsh)"
fi

# Kiro editor shell integration
[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
