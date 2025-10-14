#!/bin/bash
# Quick reference card for the help system

cat << 'EOF'
╔══════════════════════════════════════════════════════════════════════╗
║                   📚 Help System Quick Reference                     ║
╚══════════════════════════════════════════════════════════════════════╝

BASIC USAGE:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  help                    Show help menu
  help <topic>            Show help for specific topic
  h                       Shortcut for help

AVAILABLE TOPICS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  help git                Git & GitHub
  help kubernetes         Kubernetes/kubectl
  help docker             Docker & compose
  help terraform          Terraform
  help aws                AWS CLI
  help azure              Azure CLI
  help gcp                Google Cloud
  help security           Security tools
  help files              File operations
  help network            Network utilities
  help system             System monitoring
  help shortcuts          Tips & tricks
  help all                Everything

QUICK SHORTCUTS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  help-git                Same as 'help git'
  help-k8s                Same as 'help kubernetes'
  help-docker             Same as 'help docker'
  help-tf                 Same as 'help terraform'

SEARCH COMMANDS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  help all | grep pod     Find pod commands
  help all | grep log     Find log commands
  help all | grep scan    Find scan commands

MOST USED COMMANDS:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Kubernetes:
  kgp                     kubectl get pods
  kgpa                    kubectl get pods -A
  klogs <pod>             View pod logs
  kexec <pod>             Exec into pod

Docker:
  dps                     docker ps
  dimg                    docker images
  dscan <image>           Scan image
  dclean                  Clean containers

Git:
  git-work                Switch to work profile
  git-personal            Switch to personal profile
  gclone <url>            Clone with auth
  gs                      git status

Terraform:
  tfi                     terraform init
  tfp                     terraform plan
  tfa                     terraform apply

ENVIRONMENT:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Configuration:          ~/Desktop/dotfile/.env
  Edit:                   nvim ~/Desktop/dotfile/.env
  Reload:                 exec zsh

DOCUMENTATION:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  HELP_ENV_GUIDE.md       Complete help & env guide
  GIT_AUTH_GUIDE.md       Git authentication
  QUICKSTART.sh           Quick start guide

╚══════════════════════════════════════════════════════════════════════╝
EOF
