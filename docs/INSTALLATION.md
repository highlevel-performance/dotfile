# 🎉 Installation Complete!

Your DevSecOps dotfiles have been successfully created and tested. Here's everything you need to know to get started.

## 📁 What's Been Created

### Core Configuration Files
- ✅ `.zshrc` - Zsh configuration with Oh My Zsh and DevSecOps plugins
- ✅ `.tmux.conf` - Tmux configuration with custom keybindings
- ✅ `.gitconfig` - Git configuration with security features
- ✅ `.gitignore_global` - Global gitignore patterns
- ✅ `.aliases` - Command aliases for DevSecOps tools
- ✅ `.functions` - Custom shell functions
- ✅ `.exports` - Environment variables
- ✅ `.gitmessage` - Git commit message template
- ✅ `.ripgreprc` - Ripgrep configuration

### Scripts
- ✅ `setup.sh` - Full installation script
- ✅ `uninstall.sh` - Clean uninstall script
- ✅ `test.sh` - Test all configurations
- ✅ `bin/git-profile` - Git profile switcher
- ✅ `bin/git-profile-setup` - Interactive Git profile setup

### Neovim Configuration (LazyVim)
- ✅ `nvim/init.lua` - Main Neovim config
- ✅ `nvim/lua/config/options.lua` - Editor options
- ✅ `nvim/lua/config/keymaps.lua` - Keybindings
- ✅ `nvim/lua/config/autocmds.lua` - Auto commands
- ✅ `nvim/lua/plugins/devsecops.lua` - DevSecOps plugins

### Documentation
- ✅ `README.md` - Complete documentation
- ✅ `GIT_PROFILES.md` - Git profile management guide
- ✅ `QUICKREF.md` - Quick reference guide
- ✅ `INSTALLATION.md` - This file

## 🚀 Quick Start (3 Steps)

### Step 1: Install Everything

```bash
cd ~/Desktop/dotfile
./setup.sh
```

This will:
- Install Homebrew (macOS)
- Install Oh My Zsh with plugins
- Install modern CLI tools (bat, eza, fzf, ripgrep, etc.)
- Install Tmux Plugin Manager
- Create symlinks to all dotfiles
- Backup existing dotfiles
- Install DevSecOps tools (kubectl, helm, terraform, etc.)

### Step 2: Configure Git Profiles

```bash
# Interactive setup (recommended)
git-profile-setup

# Or use the commands directly
git-profile use personal    # For personal projects
git-profile use work        # For work projects
```

### Step 3: Restart Terminal

```bash
# Reload zsh or restart terminal
exec zsh

# Or simply close and reopen your terminal
```

## 🎯 Git Profile Management (Key Feature!)

### The Problem We Solve
Never accidentally commit to work repos with your personal email (or vice versa)!

### Quick Commands

```bash
# Switch to personal profile globally
git-personal
git-profile use personal

# Switch to work profile globally
git-work
git-profile use work

# Use personal profile ONLY for current repo
cd ~/work/my-side-project
git-profile local personal

# Check current profile
git-current
git-profile current

# List all profiles
git-profiles
git-profile list
```

### How It Works

1. **Separate Profiles**: You have two Git configurations:
   - `~/.git-profiles/personal` - Your personal name, email, SSH key
   - `~/.git-profiles/work` - Your work name, email, SSH key

2. **Easy Switching**: Just run `git-personal` or `git-work`

3. **Auto-Detection**: The system warns you if:
   - You're in a directory with "work" in the path but using personal profile
   - You're in a directory with "personal" in the path but using work profile

4. **Repository-Specific**: Use `git-profile local <profile>` to set different profile for specific repo

### Example Workflow

```bash
# Set personal as default
git-personal

# Work on personal projects
cd ~/personal/my-blog
git commit -m "Update post"  # Uses personal email ✅

# Switch to work for work projects
git-work

cd ~/work/company-project
git commit -m "Fix bug"  # Uses work email ✅

# But for a side project in work folder
cd ~/work/my-side-hustle
git-profile local personal  # This repo uses personal email
```

## 🔧 Essential Commands Reference

### Zsh Commands
```bash
reload          # Reload zsh configuration
zshconfig       # Edit .zshrc
```

### Docker
```bash
d               # docker
dps             # docker ps
di              # docker images
dex <container> # docker exec -it <container> bash
dscan <image>   # Scan image for vulnerabilities
```

### Kubernetes
```bash
k               # kubectl
kgp             # kubectl get pods
kl <pod>        # kubectl logs <pod>
kex <pod>       # kubectl exec -it <pod> bash
klogs           # Interactive pod log viewer (with fzf)
kexec           # Interactive pod exec (with fzf)
```

### Terraform
```bash
tf              # terraform
tfi             # terraform init
tfp             # terraform plan
tfa             # terraform apply
tfsec-scan      # Run tfsec security scan
```

### Security
```bash
secscan         # Run all security scans
gitscan         # Scan git repo for secrets
trivy-fs        # Scan filesystem
```

### Git
```bash
gs              # git status
ga              # git add
gc              # git commit
gp              # git push
glog            # Pretty git log
```

## 📦 Installed Tools

### Modern CLI Tools
- `bat` - Better cat with syntax highlighting
- `eza` - Modern ls replacement
- `ripgrep` (rg) - Fast search
- `fd` - Fast find
- `fzf` - Fuzzy finder
- `delta` - Better git diff
- `btop` - System monitor
- `procs` - Better ps
- `dust` - Better du
- `duf` - Better df

### DevSecOps Tools
- `kubectl` - Kubernetes CLI
- `helm` - Kubernetes package manager
- `terraform` - Infrastructure as Code
- `docker` - Container platform
- `aws` - AWS CLI
- `trivy` - Security scanner
- `tfsec` - Terraform security scanner

## 🎨 Customization

### Zsh Plugins Included
- git (with auto-fetch, prompt, gitignore)
- docker & docker-compose
- kubectl, helm, terraform
- aws, azure, gcloud
- zsh-autosuggestions (auto-complete as you type)
- zsh-syntax-highlighting (colorful commands)
- zsh-completions (better tab completion)
- history-substring-search
- fzf (fuzzy finder integration)
- and many more!

### Add Custom Aliases

Edit `~/.aliases` and add:
```bash
alias mycommand='echo "Hello World"'
```

Then reload:
```bash
reload
```

### Add Custom Functions

Edit `~/.functions` and add:
```bash
myfunction() {
  echo "This is my function"
}
```

### Add Environment Variables

Edit `~/.exports` and add:
```bash
export MY_VAR="value"
```

## 🔑 Keyboard Shortcuts

### Tmux (Prefix: Ctrl+A)
- `Ctrl+A` `|` - Split vertical
- `Ctrl+A` `-` - Split horizontal
- `Ctrl+A` `h/j/k/l` - Navigate panes
- `Ctrl+A` `r` - Reload config
- `Ctrl+A` `I` - Install plugins (capital i)

### Neovim (Leader: Space)
- `Space` `e` - File explorer
- `Space` `ff` - Find files
- `Space` `fg` - Search in files
- `Space` `fb` - Find buffers
- `gd` - Go to definition
- `gr` - Find references
- `K` - Show docs

### Zsh
- `Ctrl+R` - Search history (with fzf)
- `Ctrl+T` - Find files (with fzf)
- `Alt+C` - Change directory (with fzf)
- Arrow keys with autosuggestions

## 🧪 Testing

Test your installation:

```bash
cd ~/Desktop/dotfile
./test.sh
```

This runs comprehensive tests on all configurations.

## 📚 Documentation

- `README.md` - Full documentation
- `GIT_PROFILES.md` - Detailed Git profile guide
- `QUICKREF.md` - Quick command reference
- `INSTALLATION.md` - This file

## 🐛 Troubleshooting

### Zsh not loading
```bash
source ~/.zshrc
# or
exec zsh
```

### Tmux plugins not working
Open tmux and press `Ctrl+A` then `Shift+I` (capital I)

### Git profiles not switching
```bash
git-profile init
git-profile use personal
```

### Neovim plugins not installing
Open nvim and wait - plugins install automatically on first launch

### Permission issues
```bash
chmod +x ~/Desktop/dotfile/bin/*
chmod +x ~/Desktop/dotfile/*.sh
```

## 🎓 Learning Resources

### Oh My Zsh
- https://ohmyz.sh/

### Tmux
- https://github.com/tmux/tmux/wiki

### LazyVim
- https://www.lazyvim.org/

### DevSecOps Tools
- https://trivy.dev/
- https://tfsec.dev/
- https://kubernetes.io/docs/

## 🤝 Next Steps

1. ✅ Installation complete
2. ⚠️ **Configure Git profiles** - Run `git-profile-setup`
3. ⚠️ **Restart terminal** - Close and reopen your terminal
4. ⚠️ **Configure Powerlevel10k** - Run `p10k configure`
5. ⚠️ **Install Tmux plugins** - Open tmux, press `Ctrl+A` then `I`
6. ⚠️ **Open Neovim** - Run `nvim` to install plugins
7. ⚠️ **Update .gitconfig** - Add your actual name and email to profiles

## 🎉 You're All Set!

Your DevSecOps environment is ready. Happy coding!

### Quick Test Commands

```bash
# Test git profile
git-profile current

# Test modern CLI tools
ls                    # Actually runs eza
cat README.md         # Actually runs bat
grep "test" README.md # Actually runs ripgrep

# Test DevSecOps commands
k version             # kubectl
tf version           # terraform
d version            # docker

# Test functions
secscan              # Run all security scans
klogs                # Interactive pod logs
```

---

**Need Help?**
- Check `README.md` for full documentation
- Check `GIT_PROFILES.md` for Git profile details
- Check `QUICKREF.md` for quick commands
- Open an issue on GitHub

**Made with ❤️ for DevSecOps Engineers**
