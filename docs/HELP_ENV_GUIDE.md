# 🆘 Help System & Environment Configuration

## 📚 Help System

Your dotfiles now include a comprehensive help system to discover and learn all available aliases and commands!

### Quick Usage

```bash
# Show help menu
help

# Show specific topic help
help git              # Git aliases
help kubernetes       # Kubernetes/kubectl aliases  
help docker           # Docker aliases
help terraform        # Terraform aliases
help aws              # AWS CLI aliases
help security         # Security scanning tools
help files            # File operations
help all              # Show everything

# Quick shortcuts
h                     # Same as 'help'
help-git              # Same as 'help git'
help-k8s              # Same as 'help kubernetes'
help-docker           # Same as 'help docker'
help-tf               # Same as 'help terraform'
```

### Search for Specific Commands

```bash
# Search all aliases for a keyword
help all | grep pod       # Find all pod-related commands
help all | grep log       # Find all logging commands
help all | grep scan      # Find all security scanning commands
```

### Available Help Topics

| Topic | Command | Description |
|-------|---------|-------------|
| **git** | `help git` | Git aliases, profile management, GitHub tokens |
| **kubernetes** | `help kubernetes` | kubectl aliases and K8s commands |
| **docker** | `help docker` | Docker and docker-compose aliases |
| **terraform** | `help terraform` | Terraform workflow aliases |
| **aws** | `help aws` | AWS CLI shortcuts |
| **azure** | `help azure` | Azure CLI shortcuts |
| **gcp** | `help gcp` | Google Cloud Platform aliases |
| **security** | `help security` | Security scanning tools (trivy, gitleaks, tfsec) |
| **files** | `help files` | File and directory operations |
| **network** | `help network` | Network utilities |
| **system** | `help system` | System monitoring tools |
| **shortcuts** | `help shortcuts` | Quick tips and shortcuts |

---

## 🔧 Environment Configuration (.env)

All configuration variables are now centralized in the `.env` file!

### Initial Setup

1. **Copy the example file:**
   ```bash
   cd ~/Desktop/dotfile
   cp .env.example .env
   ```

2. **Edit your configuration:**
   ```bash
   nvim .env
   # or
   code .env
   ```

3. **Your .env is already configured with your information!**

### What's in .env?

#### User Information
```bash
DOTFILES_USER_NAME="Shivam Kumar"
DOTFILES_USER_EMAIL="shivam.sk2003@gmail.com"
```

#### Git Profiles
```bash
# Personal
GIT_PERSONAL_NAME="Shivam Kumar"
GIT_PERSONAL_EMAIL="shivam.sk2003@gmail.com"
GIT_PERSONAL_GITHUB_USER="shivam2003-dev"

# Work
GIT_WORK_NAME="Shivam Kumar"
GIT_WORK_EMAIL="s.kumar@kimbal.io"
GIT_WORK_GITHUB_USER="shivamkumar-kimbal"
```

#### Cloud Providers
```bash
AWS_DEFAULT_REGION="us-east-1"
AWS_PERSONAL_PROFILE="personal"
AWS_WORK_PROFILE="default"

AZURE_DEFAULT_SUBSCRIPTION=""
GCP_PROJECT_ID=""
```

#### Kubernetes
```bash
KUBE_DEFAULT_NAMESPACE="default"
KUBECONFIG_PATH="~/.kube/config"
```

#### Security
```bash
TRIVY_CACHE_DIR="~/.cache/trivy"
SECURITY_SCAN_SEVERITY="HIGH,CRITICAL"
```

#### Development Paths
```bash
PROJECTS_DIR="~/projects"
WORK_DIR="~/work"
PERSONAL_DIR="~/personal"
```

### Using Environment Variables

All variables from `.env` are automatically loaded when you start a new terminal session.

```bash
# Access variables
echo $DOTFILES_USER_NAME
echo $AWS_DEFAULT_REGION
echo $KUBE_DEFAULT_NAMESPACE

# Use in scripts
echo "Deploying to region: $AWS_DEFAULT_REGION"
```

### Security Best Practices

**⚠️ IMPORTANT:**

1. **Never commit `.env` to git** - It's already in `.gitignore`
2. **Use `.env.example` as a template** - Safe to commit
3. **Store secrets separately** - GitHub tokens are in `~/.github-tokens/`
4. **Keep backups** - But store them securely

```bash
# Good: Use the secure token storage
github-token get personal

# Bad: Don't store tokens in .env if you might commit it
GITHUB_TOKEN_PERSONAL="ghp_..."  # ❌ Don't do this
```

---

## 🎯 Examples

### Example 1: Kubernetes Commands
```bash
# Find all pod commands
help kubernetes

# Output shows:
#   kgp               → kubectl get pods
#   kgpa              → kubectl get pods -A
#   klogs <pod>       → Get logs from pod
#   kexec <pod>       → Exec into pod

# Use them:
kgp                   # List pods
kgpa                  # List all pods in all namespaces
klogs my-pod          # View logs
kexec my-pod bash     # Exec into pod
```

### Example 2: Docker Commands
```bash
# Find docker commands
help docker

# Output shows:
#   dps               → docker ps
#   dimg              → docker images
#   dexec             → docker exec -it
#   dscan <image>     → Scan image

# Use them:
dps                   # List containers
dimg                  # List images
dexec my-container bash   # Exec into container
dscan nginx:latest    # Security scan
```

### Example 3: Git Workflow
```bash
# Show git help
help git

# Output shows:
#   git-personal      → Switch to personal profile
#   git-work          → Switch to work profile
#   gclone            → Clone with auth
#   gs                → git status
#   gcm               → git commit -m

# Daily workflow:
git-work              # Switch to work
gclone https://github.com/org/repo.git
cd repo
gs                    # Check status
ga .                  # Add files
gcm "Fix bug"         # Commit
gp                    # Push
```

### Example 4: Search for Commands
```bash
# Find all commands related to "logs"
help all | grep log

# Find all commands related to "scan"
help all | grep scan

# Find all commands related to "deploy"
help all | grep deploy
```

---

## 🔄 Updating Configuration

### Update Environment Variables

1. Edit `.env`:
   ```bash
   nvim ~/Desktop/dotfile/.env
   ```

2. Reload your shell:
   ```bash
   exec zsh
   # or
   source ~/.zshrc
   ```

3. Verify:
   ```bash
   echo $YOUR_VARIABLE
   ```

### Add Custom Variables

Add your own variables to `.env`:

```bash
# Custom variables
MY_API_KEY="your-api-key"
MY_DATABASE_URL="postgresql://localhost/mydb"
MY_CUSTOM_PATH="/path/to/something"
```

Then use them in scripts or aliases:

```bash
# In your scripts
curl -H "Authorization: Bearer $MY_API_KEY" https://api.example.com

# Create custom alias
alias dbconnect='psql $MY_DATABASE_URL'
```

---

## 📖 Documentation Files

| File | Purpose |
|------|---------|
| `.env.example` | Template with all available variables |
| `.env` | Your personal configuration (not in git) |
| `bin/help` | Help system script |
| `HELP_ENV_GUIDE.md` | This file - comprehensive guide |

---

## 🎉 Quick Start

```bash
# 1. Check your environment
cat ~/Desktop/dotfile/.env

# 2. Learn available commands
help

# 3. Explore specific topics
help git
help kubernetes
help docker

# 4. Search for what you need
help all | grep pod
help all | grep docker

# 5. Start using shortcuts!
git-work
kgp
dps
```

---

## 🆘 Troubleshooting

### Environment variables not loading?

```bash
# Check if .env exists
ls -la ~/Desktop/dotfile/.env

# Reload shell
exec zsh

# Check if variable is set
echo $DOTFILES_USER_NAME
```

### Help command not found?

```bash
# Check if help is executable
ls -la ~/Desktop/dotfile/bin/help

# Make it executable
chmod +x ~/Desktop/dotfile/bin/help

# Reload shell
exec zsh

# Try again
help
```

### Want to add more aliases?

1. Edit `.aliases` file:
   ```bash
   nvim ~/Desktop/dotfile/.aliases
   ```

2. Add your alias:
   ```bash
   alias myalias='my command'
   ```

3. Update help system:
   ```bash
   nvim ~/Desktop/dotfile/bin/help
   ```

4. Reload:
   ```bash
   exec zsh
   ```

---

## ✅ Summary

✅ **Help System**
- Type `help` to see all available topics
- Type `help <topic>` for specific help
- Search with `help all | grep keyword`

✅ **Environment Configuration**
- All config in `.env` file
- Never commit `.env` (already in .gitignore)
- Use `.env.example` as template
- Automatically loaded on shell start

✅ **Quick Commands**
```bash
help                  # Show help menu
help kubernetes       # K8s aliases
help docker           # Docker aliases
help all | grep pod   # Search commands
```

**Happy DevSecOps! 🚀**
