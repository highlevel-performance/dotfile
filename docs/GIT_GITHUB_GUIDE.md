# 🔐 Git & GitHub Configuration Guide

## ✅ Your Configuration

### Personal Profile
- **Name:** Shivam Kumar
- **Email:** shivam.sk2003@gmail.com
- **GitHub:** shivam2003-dev
- **Token:** Configured ✅

### Work Profile
- **Name:** Shivam Kumar
- **Email:** s.kumar@kimbal.io
- **GitHub:** shivamkumar-kimbal
- **Token:** Configured ✅

---

## 🚀 Quick Commands

### Switch Git Profiles
```bash
# Switch to personal
git-personal

# Switch to work
git-work

# Check current profile
git-profile current
git config user.email
```

### GitHub Tokens
```bash
# List tokens
github-token list
gh-token list

# Get token
github-token get personal
github-token get work

# Test token (validates with GitHub API)
github-token test personal
github-token test work
```

---

## 📝 Usage Examples

### 1. Clone Private Repo (Personal)
```bash
# Switch to personal profile
git-personal

# Clone using HTTPS with token
git clone https://$(github-token get personal)@github.com/shivam2003-dev/private-repo.git

# Or configure credential helper (recommended)
git config --global credential.helper osxkeychain
git clone https://github.com/shivam2003-dev/private-repo.git
# Enter token when prompted
```

### 2. Clone Private Repo (Work)
```bash
# Switch to work profile
git-work

# Clone using HTTPS with token
git clone https://$(github-token get work)@github.com/shivamkumar-kimbal/company-repo.git

# Or use credential helper
git clone https://github.com/shivamkumar-kimbal/company-repo.git
# Enter work token when prompted
```

### 3. Working on Multiple Projects
```bash
# Morning - Personal projects
git-personal
cd ~/personal/my-blog
git commit -m "Update post"
git push  # Uses personal credentials ✅

# Afternoon - Work projects
git-work
cd ~/work/company-api
git commit -m "Fix bug"
git push  # Uses work credentials ✅
```

### 4. Repository-Specific Profile
```bash
# Set personal profile for one specific repo
cd ~/work/my-side-project
git-profile local personal
git commit -m "Update"  # Uses personal email ✅
git push  # Uses personal token ✅
```

---

## 🔧 Advanced Configuration

### Configure Git Credential Helper (Recommended)
```bash
# macOS Keychain (stores tokens securely)
git config --global credential.helper osxkeychain

# When you clone/push, Git will:
# 1. Ask for username (use your GitHub username)
# 2. Ask for password (use your GitHub token, not password)
# 3. Store in Keychain for future use
```

### Configure Different Credentials per Host
Add to `~/.gitconfig`:
```ini
[credential "https://github.com"]
    helper = osxkeychain
    username = shivam2003-dev  # for personal

# Or create separate configs
[credential "https://github.com/shivamkumar-kimbal"]
    helper = osxkeychain
    username = shivamkumar-kimbal
```

### SSH Keys (Alternative to Tokens)
```bash
# Generate separate SSH keys
ssh-keygen -t ed25519 -C "shivam.sk2003@gmail.com" -f ~/.ssh/id_rsa_personal
ssh-keygen -t ed25519 -C "s.kumar@kimbal.io" -f ~/.ssh/id_rsa_work

# Add to SSH agent
ssh-add ~/.ssh/id_rsa_personal
ssh-add ~/.ssh/id_rsa_work

# Copy public keys
cat ~/.ssh/id_rsa_personal.pub | pbcopy  # Add to GitHub personal
cat ~/.ssh/id_rsa_work.pub | pbcopy      # Add to GitHub work

# Then clone with SSH
git clone git@github.com:shivam2003-dev/repo.git
```

---

## 🎯 Daily Workflow

### Morning Routine
```bash
# Check current profile
git-profile current

# If working on personal projects
git-personal
cd ~/personal

# If working on work projects
git-work
cd ~/work
```

### Before Every Commit
```bash
# Verify your email
git config user.email

# If wrong:
git-personal  # or git-work
```

### Pushing to Remote
```bash
# HTTPS with token (auto-uses stored token)
git push

# If credential helper is set up, you won't need to enter token each time
```

---

## 🔐 Security Best Practices

### Token Permissions
Personal token should have:
- ✅ `repo` - Full control of private repositories
- ✅ `workflow` - Update GitHub Actions workflows
- ✅ `read:org` - Read organization data

Work token should have:
- ✅ `repo` - Full control of private repositories
- ✅ `workflow` - Update GitHub Actions workflows
- ✅ `read:org` - Read organization data
- ✅ Any additional company-required scopes

### Token Storage
Your tokens are stored in:
- **File:** `~/.github-tokens/personal.token` (permissions: 600)
- **File:** `~/.github-tokens/work.token` (permissions: 600)
- **Git config:** `github.token.personal` and `github.token.work`

For better security, use macOS Keychain:
```bash
git config --global credential.helper osxkeychain
```

### Rotate Tokens Regularly
```bash
# Delete old token
github-token delete personal

# Set new token
github-token set personal

# Test new token
github-token test personal
```

---

## 🧪 Testing Your Setup

### Test Git Profiles
```bash
# Switch to personal
git-personal
git config user.name     # Should be: Shivam Kumar
git config user.email    # Should be: shivam.sk2003@gmail.com

# Switch to work
git-work
git config user.name     # Should be: Shivam Kumar
git config user.email    # Should be: s.kumar@kimbal.io
```

### Test GitHub Tokens
```bash
# Test personal token
github-token test personal

# Test work token
github-token test work

# Both should show ✅ Token is valid
```

### Test Clone (Private Repo)
```bash
# Personal
git-personal
git clone https://$(github-token get personal)@github.com/shivam2003-dev/test-repo.git

# Work
git-work
git clone https://$(github-token get work)@github.com/shivamkumar-kimbal/test-repo.git
```

---

## 🆘 Troubleshooting

### "Authentication failed" when pushing
**Solution 1:** Check current profile
```bash
git-profile current
# Switch if needed: git-personal or git-work
```

**Solution 2:** Use token in URL
```bash
git remote set-url origin https://$(github-token get personal)@github.com/user/repo.git
```

**Solution 3:** Configure credential helper
```bash
git config --global credential.helper osxkeychain
git push  # Enter token when prompted
```

### Wrong email in commits
```bash
# Check current email
git config user.email

# Switch profile
git-personal  # or git-work

# Verify
git config user.email
```

### Token expired or invalid
```bash
# Test token
github-token test personal

# If invalid, set new token
github-token delete personal
github-token set personal
# Enter new token when prompted
```

### Can't access private repos
```bash
# Verify token has correct permissions
github-token test work

# Check token scopes at:
# https://github.com/settings/tokens
```

---

## 📚 Reference

### All Git Profile Commands
```bash
git-profile init              # Initialize profiles
git-profile use personal      # Switch to personal globally
git-profile use work          # Switch to work globally
git-profile local personal    # Use personal for current repo
git-profile current           # Show current profile
git-profile list              # List all profiles
git-profile edit personal     # Edit personal profile

# Shortcuts
git-personal                  # Quick switch to personal
git-work                      # Quick switch to work
```

### All GitHub Token Commands
```bash
github-token set personal     # Set personal token
github-token set work         # Set work token
github-token get personal     # Get personal token
github-token get work         # Get work token
github-token list             # List all tokens
github-token test personal    # Test personal token
github-token delete personal  # Delete personal token

# Shortcuts
gh-token list                 # List tokens
gh-token-personal             # Get personal token
gh-token-work                 # Get work token
```

---

## ✅ Your Setup Status

- ✅ Git profiles configured (personal & work)
- ✅ GitHub tokens stored securely
- ✅ Zsh aliases configured
- ✅ Ready to use!

### Quick Test
```bash
# Test everything
git-personal && git config user.email
git-work && git config user.email
github-token list
github-token test personal
github-token test work
```

All tests should pass! 🎉

---

**Made with ❤️ for secure Git workflows**
