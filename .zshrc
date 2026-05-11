# -------------------------------------------------
# Powerlevel10k (instant prompt)
# -------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -------------------------------------------------
# NVM (Node Version Manager)
# -------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# -------------------------------------------------
# Go configuration
# -------------------------------------------------
# 1️⃣  Go workspace(s)
#     • $HOME/go                         – default workspace (Go 1.13+ creates this automatically)
#     • $HOME/go‑custom                  – an additional custom workspace (replace with any path you like)
#     You can add more workspaces by appending :/new/dir to GOPATH.
export GOPATH="$HOME/go:$HOME/go‑custom"

# 2️⃣  Put Go binaries on the PATH (go install writes to $GOPATH/bin)
export PATH="$PATH:$GOPATH/bin"

# -------------------------------------------------
# Miscellaneous aliases / variables
# -------------------------------------------------
export nvim_config="$HOME/.config/nvim/init.lua"
alias python=python   # keep the normal python command (remove the typo if you don’t need it)

# -------------------------------------------------
# History settings
# -------------------------------------------------
HISTSIZE=200000
SAVEHIST=200000
HISTFILE=~/.zsh_history
HISTFILESIZE=20000

# -------------------------------------------------
# Theme & plugins
# -------------------------------------------------
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# -------------------------------------------------
# System PATH (add Homebrew, system dirs, etc.)
# -------------------------------------------------
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
