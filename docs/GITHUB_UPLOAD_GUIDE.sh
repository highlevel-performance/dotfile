#!/usr/bin/env bash

# GITHUB_UPLOAD_GUIDE.sh - Complete guide for safely uploading dotfiles to GitHub

# ================================
# 🔒 SECURITY CHECKLIST
# ================================

echo "📋 SECURITY CHECKLIST BEFORE GITHUB UPLOAD"
echo "=========================================="
echo ""

# 1. Scan for secrets
echo "1️⃣  Scanning for secrets..."
if ./bin/scan-secrets; then
    echo "   ✅ No secrets found"
else
    echo "   ❌ SECRETS DETECTED - DO NOT UPLOAD!"
    exit 1
fi
echo ""

# 2. Verify .gitignore
echo "2️⃣  Verifying .gitignore..."
REQUIRED_PATTERNS=(
    ".env"
    "*.token"
    ".github-tokens/"
    "*.key"
    "*.pem"
    "credentials"
)

for pattern in "${REQUIRED_PATTERNS[@]}"; do
    if grep -q "$pattern" .gitignore; then
        echo "   ✅ $pattern is ignored"
    else
        echo "   ⚠️  $pattern might not be ignored"
    fi
done
echo ""

# 3. Check for tracked secret files
echo "3️⃣  Checking for tracked secret files..."
DANGEROUS_FILES=(
    ".env"
    ".github-tokens/personal"
    ".github-tokens/work"
    "id_rsa"
    "*.pem"
)

tracked_secrets=0
for file in "${DANGEROUS_FILES[@]}"; do
    if git ls-files --error-unmatch "$file" 2>/dev/null; then
        echo "   ❌ DANGER: $file is tracked by git!"
        tracked_secrets=$((tracked_secrets + 1))
    fi
done

if [ $tracked_secrets -eq 0 ]; then
    echo "   ✅ No secret files are tracked"
else
    echo "   ❌ DANGER: Remove these files from git tracking!"
    exit 1
fi
echo ""

# 4. Verify .env is properly configured
echo "4️⃣  Verifying .env configuration..."
if [ -f .env ]; then
    echo "   ✅ .env exists (should NOT be uploaded)"
    if git ls-files --error-unmatch .env 2>/dev/null; then
        echo "   ❌ DANGER: .env is tracked by git!"
        exit 1
    else
        echo "   ✅ .env is properly ignored"
    fi
else
    echo "   ⚠️  .env not found"
fi

if [ -f .env.example ]; then
    echo "   ✅ .env.example exists (this SHOULD be uploaded)"
else
    echo "   ⚠️  .env.example not found"
fi
echo ""

# 5. Check git status
echo "5️⃣  Checking git status..."
if git status --porcelain | grep -q ".env$"; then
    echo "   ❌ DANGER: .env has changes!"
    exit 1
else
    echo "   ✅ .env is not in staging area"
fi
echo ""

echo "=========================================="
echo "✅ ALL SECURITY CHECKS PASSED!"
echo "=========================================="
echo ""

# ================================
# 📤 UPLOAD STEPS
# ================================

cat << 'EOF'

📤 STEPS TO UPLOAD TO GITHUB
========================================

1. INITIALIZE GIT REPOSITORY (if not done)
   ----------------------------------------
   cd /Users/shivamkumar/Desktop/dotfile
   git init
   git add .
   git commit -m "Initial commit: DevSecOps dotfiles"


2. CREATE GITHUB REPOSITORY
   ----------------------------------------
   • Go to https://github.com/new
   • Repository name: dotfiles (or your preferred name)
   • Description: "DevSecOps dotfiles for Zsh, Tmux, Neovim, and more"
   • Choose: Public or Private
   • DO NOT initialize with README (we already have one)
   • Click "Create repository"


3. LINK LOCAL TO GITHUB
   ----------------------------------------
   # Replace YOUR_USERNAME with your GitHub username
   git remote add origin https://github.com/YOUR_USERNAME/dotfiles.git
   
   # Or use SSH (recommended if you have SSH keys set up)
   git remote add origin git@github.com:YOUR_USERNAME/dotfiles.git


4. PUSH TO GITHUB
   ----------------------------------------
   git branch -M main
   git push -u origin main


5. VERIFY UPLOAD
   ----------------------------------------
   • Visit https://github.com/YOUR_USERNAME/dotfiles
   • Verify README.md is displayed
   • Check that .env is NOT visible (only .env.example should be there)
   • Verify bin/ scripts are present


6. POST-UPLOAD SETUP
   ----------------------------------------
   Add these badges to README.md:
   
   [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
   [![Shell: Zsh](https://img.shields.io/badge/Shell-Zsh-1f425f.svg)](https://www.zsh.org/)
   [![OS: macOS](https://img.shields.io/badge/OS-macOS-blue.svg)](https://www.apple.com/macos/)


========================================
⚠️  IMPORTANT REMINDERS
========================================

1. NEVER commit .env file
   - Always use .env.example for templates
   - Real secrets go in .env (git-ignored)

2. DOUBLE-CHECK before pushing
   - Run: ./bin/scan-secrets
   - Review: git diff --cached

3. ROTATE tokens if accidentally committed
   - Generate new GitHub tokens at: https://github.com/settings/tokens
   - Update your .env file
   - Run: sync-tokens

4. USE SSH for private repos
   - Set up SSH keys: https://docs.github.com/en/authentication
   - Use git@github.com URLs instead of https://

5. KEEP .gitignore updated
   - Add new secret patterns as needed
   - Test with: git check-ignore -v <file>


========================================
🔧 USEFUL COMMANDS
========================================

# Check what will be committed
git status

# See what changes will be uploaded
git diff --cached

# Remove file from staging (if you added something by mistake)
git reset HEAD <file>

# Remove file from git tracking (but keep local file)
git rm --cached <file>

# View commit history
git log --oneline

# Create a new branch for testing
git checkout -b test-upload

# Scan for secrets before committing
./bin/scan-secrets


========================================
🚨 IF YOU ACCIDENTALLY COMMIT SECRETS
========================================

1. IMMEDIATE ACTION - Remove from history:
   git filter-branch --force --index-filter \
     "git rm --cached --ignore-unmatch .env" \
     --prune-empty --tag-name-filter cat -- --all

2. FORCE PUSH (destructive, use with caution):
   git push origin --force --all

3. ROTATE ALL EXPOSED SECRETS:
   - GitHub tokens: https://github.com/settings/tokens
   - AWS keys: https://console.aws.amazon.com/iam/
   - Azure keys: https://portal.azure.com/
   - GCP keys: https://console.cloud.google.com/

4. ALTERNATIVE - Use BFG Repo-Cleaner:
   brew install bfg
   bfg --delete-files .env
   git reflog expire --expire=now --all
   git gc --prune=now --aggressive


========================================
📚 ADDITIONAL RESOURCES
========================================

• GitHub Security Best Practices:
  https://docs.github.com/en/code-security

• Git Secrets Tool:
  https://github.com/awslabs/git-secrets

• Dotfiles Management:
  https://dotfiles.github.io/

• This Repository's Documentation:
  - README.md           - Main documentation
  - INSTALLATION.md     - Setup instructions
  - GIT_PROFILES.md     - Git profile management
  - HELP_ENV_GUIDE.md   - Environment variables


========================================

EOF

echo "✨ Ready to upload! Follow the steps above."
echo ""
echo "Quick start:"
echo "  git remote add origin https://github.com/YOUR_USERNAME/dotfiles.git"
echo "  git branch -M main"
echo "  git push -u origin main"
echo ""
