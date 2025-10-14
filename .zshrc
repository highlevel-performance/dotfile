# ================================
# DevSecOps Engineer ZSH Config
# ================================

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme - powerlevel10k recommended for DevSecOps
ZSH_THEME="powerlevel10k/powerlevel10k"

# Update behavior
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

# Plugins for DevSecOps workflows
plugins=(
  git
  git-auto-fetch
  git-prompt
  gitignore
  github
  docker
  docker-compose
  kubectl
  terraform
  helm
  aws
  azure
  gcloud
  ansible
  vault
  sudo
  command-not-found
  colored-man-pages
  colorize
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
  history-substring-search
  fzf
  tmux
  python
  pip
  golang
  rust
  node
  npm
  web-search
  copyfile
  copypath
  jsontools
  encode64
)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# ================================
# User Configuration
# ================================

# Load environment variables from .env file
export DOTFILES_DIR="${HOME}/.dotfiles"

# Add dotfiles bin to PATH
export PATH="${DOTFILES_DIR}/bin:${PATH}"

if [[ -f "${DOTFILES_DIR}/.env" ]]; then
    # Export all variables from .env (skip comments and empty lines)
    set -a
    source "${DOTFILES_DIR}/.env"
    set +a
fi

# Load additional config files
[[ -f ~/.exports ]] && source ~/.exports
[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.functions ]] && source ~/.functions
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# ================================
# Environment Variables
# ================================

# Editor
export EDITOR='nvim'
export VISUAL='nvim'

# Language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# History
export HISTSIZE=50000
export SAVEHIST=50000
export HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# ================================
# Path Configuration
# ================================

# Homebrew (macOS)
if [[ -d "/opt/homebrew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Add local bin to PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Add dotfiles bin to PATH for custom scripts
export PATH="$HOME/Desktop/dotfile/bin:$PATH"

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Python
export PATH="$HOME/.local/share/pyenv/bin:$PATH"

# Node
export PATH="$HOME/.local/share/nvm/versions/node/$(ls ~/.local/share/nvm/versions/node 2>/dev/null | tail -1)/bin:$PATH" 2>/dev/null

# Krew (kubectl plugin manager)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# ================================
# DevSecOps Quick Aliases
# ================================

# Kubernetes
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgn='kubectl get nodes'
alias kd='kubectl describe'
alias kdp='kubectl describe pod'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias kex='kubectl exec -it'
alias kctx='kubectx'
alias kns='kubens'

# Docker
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias drm='docker rm'
alias drmi='docker rmi'
alias dex='docker exec -it'
alias dlogs='docker logs -f'

# Security Tools
alias nmap-quick='nmap -T4 -F'
alias nmap-full='nmap -T4 -A -v'
alias trivy-image='trivy image'
alias trivy-fs='trivy fs .'
alias grype-scan='grype'
alias snyk-test='snyk test'

# Git Security
alias git-secrets-scan='git secrets --scan'
alias gitleaks-scan='gitleaks detect -v'

# Terraform
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'
alias tfv='terraform validate'
alias tfsec-scan='tfsec .'

# AWS
alias awswho='aws sts get-caller-identity'
alias awsregion='aws configure get region'

# General
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias cat='bat --style=plain'
alias ls='eza --icons'
alias ll='eza -la --icons --git'
alias lt='eza --tree --level=2 --icons'
alias grep='rg'
alias find='fd'
alias ps='procs'
alias top='btop'

# ================================
# Security & Completion
# ================================

# Enable completion for kubectl
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# Enable completion for helm
[[ $commands[helm] ]] && source <(helm completion zsh)

# Enable completion for terraform
[[ $commands[terraform] ]] && complete -o nospace -C /usr/local/bin/terraform terraform

# Enable completion for docker
[[ $commands[docker] ]] && source <(docker completion zsh)

# FZF configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# ================================
# Tool Initialization
# ================================

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# rbenv
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init - zsh)"
fi

# direnv
if command -v direnv 1>/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# ================================
# Powerlevel10k Instant Prompt
# ================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ================================
# Git Profile Management
# ================================

# Show current git profile in prompt (optional)
git_profile_prompt() {
  if [ -f "$HOME/.git-profile-current" ]; then
    local profile=$(cat "$HOME/.git-profile-current")
    echo "[git:$profile]"
  fi
}

# Aliases for quick profile switching
alias git-personal='git-profile use personal'
alias git-work='git-profile use work'
alias git-status='git-profile current'
alias git-profiles='git-profile list'

# GitHub token aliases
alias gh-token='github-token'
alias gh-token-personal='github-token get personal'
alias gh-token-work='github-token get work'
alias gh-test='github-token test'

# Auto-detect and warn if in work directory with personal profile (or vice versa)
git_profile_check() {
  if [ -d ".git" ] && [ -f "$HOME/.git-profile-current" ]; then
    local current_profile=$(cat "$HOME/.git-profile-current")
    local repo_path=$(pwd)
    
    # Check if in work directory with personal profile
    if [[ "$repo_path" =~ "work" ]] && [[ "$current_profile" == "personal" ]]; then
      echo "⚠️  Warning: You're in a work directory but using PERSONAL git profile!"
      echo "   Run 'git-work' to switch to work profile"
    fi
    
    # Check if in personal directory with work profile
    if [[ "$repo_path" =~ "personal" ]] && [[ "$current_profile" == "work" ]]; then
      echo "⚠️  Warning: You're in a personal directory but using WORK git profile!"
      echo "   Run 'git-personal' to switch to personal profile"
    fi
  fi
}

# Run check when changing directories
autoload -U add-zsh-hook
add-zsh-hook chpwd git_profile_check

# Initialize git profiles on first run
if [ ! -d "$HOME/.git-profiles" ]; then
  echo "🔧 Initializing Git profile system..."
  git-profile init
fi

# ================================
# Help System
# ================================
# Alias for the help command
alias help="${DOTFILES_DIR}/bin/help"
alias h='help'

# Quick help shortcuts
alias help-git='help git'
alias help-k8s='help kubernetes'
alias help-docker='help docker'
alias help-tf='help terraform'

# ================================
# Environment & Configuration Management
# ================================
alias edit-env="${EDITOR:-nvim} ${DOTFILES_DIR}/.env"
alias reload-env='source ~/.zshrc'
alias sync-profiles="${DOTFILES_DIR}/bin/sync-git-profiles"
alias sync-tokens="${DOTFILES_DIR}/bin/sync-github-tokens"
alias sync-all='sync-profiles && sync-tokens'
alias dotfiles="cd ${DOTFILES_DIR}"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
