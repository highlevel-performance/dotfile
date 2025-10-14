#!/usr/bin/env bash

# Quick start guide
cat << 'EOF'

╔════════════════════════════════════════════════════════════╗
║                                                            ║
║     📝 QUICK START CHECKLIST - DevSecOps Dotfiles         ║
║                                                            ║
╚════════════════════════════════════════════════════════════╝

🎯 STEP-BY-STEP INSTALLATION GUIDE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

☐ Step 1: Run Installation Script
   cd ~/Desktop/dotfile
   ./setup.sh
   
   This installs:
   • Homebrew (macOS) or apt packages (Linux)
   • Oh My Zsh with Powerlevel10k
   • 35+ zsh plugins
   • Modern CLI tools (bat, eza, fzf, ripgrep, etc.)
   • Tmux Plugin Manager
   • DevSecOps tools (kubectl, helm, terraform, etc.)
   • Creates symlinks to all dotfiles

☐ Step 2: Configure Git Profiles ⭐ IMPORTANT!
   git-profile-setup
   
   You'll be asked for:
   Personal:
   • Name: Your Personal Name
   • Email: your.personal@email.com
   • GitHub username: yourhandle
   • SSH key: ~/.ssh/id_rsa_personal (optional)
   • GPG key: YOUR_GPG_KEY_ID (optional)
   
   Work:
   • Name: Your Work Name
   • Email: your.work@company.com
   • GitHub/GitLab username: work-handle
   • SSH key: ~/.ssh/id_rsa_work (optional)
   • GPG key: YOUR_WORK_GPG_KEY (optional)

☐ Step 3: Restart Terminal
   exec zsh
   
   Or simply close and reopen your terminal

☐ Step 4: Configure Powerlevel10k Theme
   p10k configure
   
   Follow the interactive wizard to customize your prompt

☐ Step 5: Install Tmux Plugins
   • Open tmux: tmux
   • Press: Ctrl+A then Shift+I (capital I)
   • Wait for plugins to install
   • Exit tmux: exit

☐ Step 6: Open Neovim
   nvim
   
   • Plugins will auto-install on first launch
   • Wait for completion (may take 1-2 minutes)
   • Exit: :qa

☐ Step 7: Test Git Profiles
   git-profile current
   git-profile list
   git-personal
   git config user.email    # Should show personal email
   git-work
   git config user.email    # Should show work email

☐ Step 8: Test Commands
   # Modern CLI tools
   ls                      # Should use eza
   cat README.md           # Should use bat
   
   # DevSecOps aliases
   k version              # kubectl
   d version              # docker
   tf version             # terraform
   
   # Functions
   git-profile current    # Show active profile
   secscan               # Run security scans (if tools installed)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ VERIFICATION CHECKLIST
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

☐ Oh My Zsh installed
   Test: echo $ZSH

☐ Zsh plugins loaded
   Test: alias | grep "git="

☐ Git profiles working
   Test: git-profile list

☐ Autosuggestions working
   Type: git (you should see suggestions)

☐ Syntax highlighting working
   Type: ls (should be colored)

☐ Tmux prefix changed
   Test: In tmux, press Ctrl+A ? (shows help)

☐ Neovim plugins installed
   Test: nvim (should see plugins loaded)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎮 DAILY WORKFLOW
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Morning - Working on Personal Projects:
   git-personal
   cd ~/personal/my-project
   git commit -m "Update"    # Uses personal email ✅

Afternoon - Switch to Work:
   git-work
   cd ~/work/company-project
   git commit -m "Fix bug"   # Uses work email ✅

Side Project in Work Folder:
   cd ~/work/side-hustle
   git-profile local personal
   git commit -m "Update"    # Uses personal email ✅

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📖 KEY COMMANDS TO REMEMBER
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Git Profiles:
   git-personal           Switch to personal globally
   git-work              Switch to work globally
   git-profile local personal   Use personal for this repo only
   git-profile current   Show active profile

Shortcuts:
   Ctrl+R                Search command history (fzf)
   Tab                   Auto-complete with suggestions
   reload                Reload zsh config
   
Docker:
   d ps                  docker ps
   dex <container>       docker exec -it <container> bash
   dscan <image>         Scan image for vulnerabilities

Kubernetes:
   k get pods            kubectl get pods
   klogs                 Interactive pod logs
   kexec                 Interactive pod shell

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📚 DOCUMENTATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

   README.md          Complete documentation
   INSTALLATION.md    Installation guide (you are here!)
   GIT_PROFILES.md    Git profile management details
   QUICKREF.md        Quick command reference
   SUMMARY.md         Complete feature summary

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🆘 TROUBLESHOOTING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Problem: Git profile not switching
Solution: git-profile init && git-profile use personal

Problem: Zsh plugins not loading
Solution: rm -rf ~/.zcompdump* && source ~/.zshrc

Problem: Tmux prefix not working
Solution: tmux kill-server && tmux

Problem: Neovim plugins not installing
Solution: rm -rf ~/.local/share/nvim && nvim

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎉 YOU'RE READY!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Once you complete all steps above, you'll have:
✅ Oh My Zsh with 35+ plugins
✅ Git profile management (personal/work)
✅ Modern CLI tools (bat, eza, fzf, ripgrep, etc.)
✅ Tmux with custom keybindings
✅ Neovim with LazyVim for DevSecOps
✅ 100+ aliases and 20+ custom functions
✅ Security scanners integrated
✅ Auto-completion and syntax highlighting

Happy DevSecOps! 🚀

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

EOF
