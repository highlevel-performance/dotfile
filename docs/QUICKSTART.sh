#!/bin/bash
# Quick Start Guide - Get up and running in 5 minutes!

cat << 'EOF'
╔═══════════════════════════════════════════════════════════════════════════════╗
║                  🚀 DevSecOps Dotfiles - Quick Start                          ║
╔═══════════════════════════════════════════════════════════════════════════════╗

👋 Welcome, Shivam Kumar!

Your comprehensive DevSecOps dotfiles are configured and ready to use!

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📋 INSTALLATION STATUS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ Zsh with Oh My Zsh + 35 plugins
✅ Powerlevel10k theme
✅ Tmux with TPM (Tmux Plugin Manager)
✅ Neovim with LazyVim + DevSecOps plugins
✅ Git with delta diff viewer
✅ Modern CLI tools (bat, eza, fzf, ripgrep, fd, zoxide, btop)
✅ DevSecOps tools (kubectl, helm, terraform, docker, trivy, tfsec, hadolint)
✅ Git profile management (Personal/Work separation)
✅ GitHub token management (secure storage)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎯 NEXT STEPS (5 minutes)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Step 1: Reload Your Terminal
────────────────────────────
Run this command to activate all configurations:

    exec zsh

Or restart your terminal application.


Step 2: Configure Powerlevel10k Theme (Optional - 2 minutes)
─────────────────────────────────────────────────────────────
Customize your prompt appearance:

    p10k configure

This will ask you about:
  • Prompt style (Rainbow, Pure, Lean, Classic, etc.)
  • Character set (Unicode, ASCII)
  • Prompt colors
  • Show/hide icons
  • Instant prompt mode

TIP: Choose "Rainbow" style with Unicode for the best DevSecOps experience!


Step 3: Install Tmux Plugins (Optional - 1 minute)
───────────────────────────────────────────────────
If you use tmux:

    1. Start tmux: tmux
    2. Press: Ctrl+A then Shift+I (capital I)
    3. Wait for plugins to install
    4. Done!


Step 4: Launch Neovim (Optional - 2 minutes)
─────────────────────────────────────────────
LazyVim will auto-install plugins on first launch:

    nvim

Wait for all plugins to install (about 30 seconds).
Press 'q' to close the Lazy panel when done.


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎨 YOUR GIT PROFILES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

👤 Personal Profile
───────────────────
Name:   Shivam Kumar
Email:  shivam.sk2003@gmail.com
GitHub: shivam2003-dev
Token:  ✅ Valid

💼 Work Profile
───────────────
Name:   Shivam Kumar
Email:  s.kumar@kimbal.io
GitHub: shivamkumar-kimbal
Token:  ✅ Valid

🔄 Switch Profiles
──────────────────
    git-personal    # Switch to personal
    git-work        # Switch to work


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚡ QUICK COMMANDS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Git Profile Management:
  git-personal              # Switch to personal profile
  git-work                  # Switch to work profile
  git-profile current       # Check current profile
  git config user.email     # Verify email

GitHub Tokens:
  github-token list         # List all tokens
  github-token test personal # Test personal token
  github-token test work    # Test work token
  gh-token list             # Shortcut

Kubernetes:
  k get pods                # List pods (alias for kubectl)
  kgp                       # Quick pod list
  kgd                       # List deployments
  kgs                       # List services
  kexec pod-name            # Exec into pod
  klogs pod-name            # View logs
  kdesc pod pod-name        # Describe pod

Docker:
  dps                       # List containers
  dimg                      # List images
  drun image                # Run container
  dexec container           # Exec into container
  dlogs container           # View logs
  dclean                    # Clean up containers/images

Security Scanning:
  dscan image               # Scan Docker image
  secscan directory         # Security scan directory
  gitscan                   # Scan git repo

Terraform:
  tfi                       # terraform init
  tfp                       # terraform plan
  tfa                       # terraform apply
  tfd                       # terraform destroy

Modern CLI:
  cat file → bat file       # Better cat with syntax highlighting
  ls → eza                  # Better ls with icons
  cd → z directory          # Jump to directory (zoxide)
  find → fd pattern         # Better find
  grep → rg pattern         # Faster grep (ripgrep)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 DOCUMENTATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

README.md                  # Main documentation
INSTALLATION.md            # Step-by-step installation guide
GIT_PROFILES.md            # Git profile management details
GIT_GITHUB_GUIDE.md        # Comprehensive Git/GitHub workflows
QUICKREF.md                # Quick command reference
SUMMARY.md                 # Feature summary

View any documentation:
    cat README.md
    bat README.md  # With syntax highlighting


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🧪 TEST YOUR SETUP
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Run comprehensive status check:

    ./status.sh

This checks:
  ✓ Git profiles configuration
  ✓ GitHub tokens validity
  ✓ Installed tools
  ✓ Zsh plugins
  ✓ Neovim & Tmux setup


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💡 DAILY WORKFLOW EXAMPLE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Morning - Personal Projects:
  $ git-personal
  $ cd ~/personal/my-blog
  $ git commit -m "Update post"
  $ git push  # Uses personal credentials ✅

Afternoon - Work Projects:
  $ git-work
  $ cd ~/work/api-service
  $ git commit -m "Fix bug"
  $ git push  # Uses work credentials ✅

Security Scanning:
  $ cd ~/work/api-service
  $ dscan nginx:latest        # Scan Docker image
  $ secscan .                 # Scan current directory
  $ gitscan                   # Scan git history

Kubernetes Operations:
  $ k get pods -A             # All pods in all namespaces
  $ kexec my-pod bash         # Exec into pod
  $ klogs my-pod --follow     # Follow logs


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🆘 TROUBLESHOOTING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Issue: "Command not found" errors
Solution: Reload terminal → exec zsh

Issue: Wrong email in commits
Solution: Switch profile → git-personal or git-work

Issue: Can't push to GitHub
Solution: 
  1. Check profile → git config user.email
  2. Test token → github-token test personal
  3. Switch if needed → git-personal or git-work

Issue: Powerlevel10k not showing
Solution: Configure theme → p10k configure

Issue: Tmux plugins not working
Solution: 
  1. Open tmux → tmux
  2. Install plugins → Ctrl+A then Shift+I


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎉 YOU'RE ALL SET!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Your DevSecOps environment is fully configured with:
  • Separate personal & work Git profiles
  • Secure GitHub token storage
  • 100+ DevSecOps aliases
  • 20+ custom functions
  • Modern CLI tools
  • Complete Neovim IDE
  • Powerful Tmux setup

Start with: exec zsh

Questions? Check the documentation:
  cat README.md
  cat GIT_GITHUB_GUIDE.md

Happy coding! 🚀

╚═══════════════════════════════════════════════════════════════════════════════╝
EOF
