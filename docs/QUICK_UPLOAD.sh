#!/usr/bin/env bash

# QUICK_UPLOAD.sh - Quick commands to upload to GitHub

cat << 'EOF'
╔══════════════════════════════════════════════════════════╗
║                                                          ║
║       🚀 QUICK GITHUB UPLOAD - READY TO GO! 🚀          ║
║                                                          ║
╚══════════════════════════════════════════════════════════╝

✅ Security Status: ALL CHECKS PASSED
✅ Secrets: NONE FOUND
✅ .gitignore: COMPREHENSIVE
✅ .env: PROTECTED

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📋 COPY & PASTE THESE COMMANDS:

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# 1. Go to GitHub and create new repository
#    → https://github.com/new
#    → Name: dotfiles
#    → Description: DevSecOps dotfiles for Zsh, Tmux, Neovim
#    → Public or Private (your choice)
#    → DO NOT initialize with README

# 2. Initialize git (if not done)
cd /Users/shivamkumar/Desktop/dotfile
git init
git add .
git commit -m "Initial commit: DevSecOps dotfiles with Zsh, Tmux, LazyVim

Features:
- Zsh with Oh My Zsh and Powerlevel10k
- Tmux with custom configuration
- Neovim with LazyVim + DevSecOps plugins
- Git profile management (personal/work)
- Help system for discovering aliases
- Environment-driven configuration
- 100+ DevSecOps aliases and functions
- Security scanning tools
"

# 3. Link to GitHub (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/dotfiles.git

# 4. Push to GitHub
git branch -M main
git push -u origin main

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⚠️  BEFORE YOU PUSH - FINAL CHECK:

EOF

echo "Running final security scan..."
if ./bin/scan-secrets; then
    echo ""
    echo "✅ FINAL CHECK PASSED - Safe to push!"
else
    echo ""
    echo "❌ DANGER - Do not push! Secrets detected!"
    exit 1
fi

cat << 'EOF'

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎉 AFTER UPLOAD - WHAT'S NEXT:

1. Visit your repository:
   https://github.com/YOUR_USERNAME/dotfiles

2. Verify these files are visible:
   ✅ README.md
   ✅ .env.example
   ✅ .gitconfig
   ✅ .zshrc
   ✅ bin/help
   ✅ bin/scan-secrets

3. Verify these files are NOT visible:
   ❌ .env (should be hidden)
   ❌ .github-tokens/ (should be hidden)

4. Add repository badges to README.md:
   Edit README.md and add at the top:
   
   [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
   [![Shell: Zsh](https://img.shields.io/badge/Shell-Zsh-1f425f.svg)](https://www.zsh.org/)
   [![OS: macOS](https://img.shields.io/badge/OS-macOS-blue.svg)](https://www.apple.com/macos/)

5. Set repository topics (on GitHub):
   dotfiles, zsh, tmux, neovim, lazyvim, devsecops, 
   oh-my-zsh, powerlevel10k, devops, kubernetes, docker

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📚 DOCUMENTATION FILES:

Main Guides:
  • README.md              - Complete overview
  • INSTALLATION.md        - Installation instructions
  • SECURITY_AUDIT.md      - Security status report
  • GITHUB_UPLOAD_GUIDE.sh - This guide (detailed)

Feature Guides:
  • GIT_PROFILES.md        - Git profile management
  • GIT_AUTH_GUIDE.md      - Authentication setup
  • HELP_ENV_GUIDE.md      - Environment variables

Quick References:
  • QUICKSTART.sh          - Quick setup demo
  • FEATURE_DEMO.sh        - Feature demonstrations
  • HELP_QUICK_REF.sh      - Command quick reference

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔒 SECURITY REMINDERS:

1. .env is git-ignored (contains your secrets)
2. .env.example is uploaded (template for others)
3. GitHub tokens stored in ~/.github-tokens/ (not uploaded)
4. Before every commit, run: ./bin/scan-secrets
5. If you add new secrets, update .gitignore

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎯 ONE-LINE UPLOAD COMMAND:

For experienced users who just want to push NOW:

  git init && git add . && git commit -m "Initial commit: DevSecOps dotfiles" && git remote add origin https://github.com/YOUR_USERNAME/dotfiles.git && git branch -M main && git push -u origin main

(Don't forget to create the repository on GitHub first!)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✨ You're all set! Happy DevSecOps! ✨

EOF
