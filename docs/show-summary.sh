#!/usr/bin/env bash

# ================================
# DevSecOps Dotfiles Summary
# ================================

cat << 'EOF'

╔════════════════════════════════════════════════════════════════╗
║                                                                ║
║        🚀 DevSecOps Dotfiles - Installation Complete! 🚀      ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝

📦 CREATED FILES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Core Configuration:
  ✅ .zshrc               - Zsh with Oh My Zsh & DevSecOps plugins
  ✅ .tmux.conf           - Tmux with custom keybindings
  ✅ .gitconfig           - Git with security features
  ✅ .gitignore_global    - Global gitignore patterns
  ✅ .aliases             - DevSecOps command aliases
  ✅ .functions           - Custom shell functions
  ✅ .exports             - Environment variables
  ✅ .gitmessage          - Commit message template
  ✅ .ripgreprc           - Ripgrep configuration

Scripts:
  ✅ setup.sh             - Full installation script
  ✅ uninstall.sh         - Clean uninstall
  ✅ test.sh              - Configuration tests
  ✅ bin/git-profile      - Git profile switcher
  ✅ bin/git-profile-setup - Interactive Git setup

Neovim (LazyVim):
  ✅ nvim/init.lua        - Main configuration
  ✅ nvim/lua/config/     - Options, keymaps, autocmds
  ✅ nvim/lua/plugins/    - DevSecOps plugins

Documentation:
  ✅ README.md            - Complete documentation
  ✅ INSTALLATION.md      - Installation guide
  ✅ GIT_PROFILES.md      - Git profile management
  ✅ QUICKREF.md          - Quick reference

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎯 KEY FEATURES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✨ Git Profile Management (NEW!)
   • Separate personal and work Git configurations
   • Never commit to wrong account again!
   • Commands: git-personal, git-work, git-profile local

🔧 DevSecOps Tools Support
   • Docker, Kubernetes, Terraform
   • AWS, Azure, GCP CLIs
   • Security scanners: Trivy, tfsec, Grype

🎨 Modern CLI Tools
   • bat (better cat), eza (better ls)
   • ripgrep (better grep), fd (better find)
   • fzf (fuzzy finder), delta (better diff)

📝 Smart Shell Features
   • Autosuggestions (type faster)
   • Syntax highlighting (see errors)
   • Auto-completion for git, docker, kubectl, etc.
   • Custom functions and aliases

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🚀 QUICK START (3 STEPS)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1️⃣  Install Everything:
   cd ~/Desktop/dotfile
   ./setup.sh

2️⃣  Configure Git Profiles:
   git-profile-setup
   # Or manually:
   # git-profile use personal
   # git-profile use work

3️⃣  Restart Terminal:
   exec zsh
   # Or close and reopen terminal

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎮 ESSENTIAL COMMANDS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Git Profiles:
  git-personal           Switch to personal profile
  git-work              Switch to work profile
  git-profile current   Show current profile
  git-profile list      List all profiles

Docker:
  d                     docker
  dps                   docker ps
  dscan <image>         Scan image for vulnerabilities

Kubernetes:
  k                     kubectl
  kgp                   kubectl get pods
  klogs                 Interactive pod log viewer
  kexec                 Interactive pod exec

Terraform:
  tf                    terraform
  tfsec-scan           Run security scan

Security:
  secscan              Run all security scans
  gitscan              Scan git repo for secrets

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔑 KEYBOARD SHORTCUTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Tmux (Prefix: Ctrl+A):
  Ctrl+A |             Split vertical
  Ctrl+A -             Split horizontal
  Ctrl+A h/j/k/l       Navigate panes
  Ctrl+A r             Reload config

Neovim (Leader: Space):
  Space e              File explorer
  Space ff             Find files
  Space fg             Search in files
  gd                   Go to definition

Zsh:
  Ctrl+R               Search history (fzf)
  Ctrl+T               Find files (fzf)
  Tab                  Auto-complete

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📖 DOCUMENTATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  📄 README.md          Complete documentation
  📄 INSTALLATION.md    Installation guide
  📄 GIT_PROFILES.md    Git profile management
  📄 QUICKREF.md        Quick command reference

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⚠️  NEXT STEPS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  1. Run: ./setup.sh (if not done already)
  2. Run: git-profile-setup (configure personal/work)
  3. Restart terminal (exec zsh)
  4. Run: p10k configure (configure theme)
  5. Open tmux, press Ctrl+A then I (install plugins)
  6. Open nvim (plugins install automatically)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎉 YOU'RE ALL SET!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Your DevSecOps environment is ready!

Test it:
  git-profile current        Check Git profile
  k version                  Test kubectl
  d version                  Test Docker
  secscan                    Run security scans

Need help? Check the documentation files above.

Made with ❤️  for DevSecOps Engineers

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

EOF
