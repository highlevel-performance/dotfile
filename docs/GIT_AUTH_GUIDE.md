# 🔐 Git Authentication Guide

## ✅ Your Setup

You can now clone private repositories easily using your configured tokens!

---

## 🚀 Quick Usage

### Method 1: Use `git-clone-auth` (Recommended)
This automatically uses your current profile's token:

```bash
# Switch to work profile
git-work

# Clone with automatic authentication
git-clone-auth https://github.com/sinhaludyog/devops.git

# Or use the shortcut
gclone https://github.com/sinhaludyog/devops.git

# Clone into a specific directory
gclone https://github.com/sinhaludyog/devops.git my-project
```

### Method 2: Use GitHub CLI style
```bash
# For personal repos
git-personal
gh auth login  # One-time setup
git clone https://github.com/username/repo.git
```

### Method 3: Manual token in URL (Not recommended - exposes token)
```bash
# Get your token
TOKEN=$(github-token get work)

# Clone with token
git clone https://$TOKEN@github.com/sinhaludyog/devops.git
```

---

## 📝 Complete Workflow Example

### Cloning Work Repository
```bash
# 1. Switch to work profile
git-work
✅ Switched to 'work' profile
Current Git Configuration:
  Name:  Shivam Kumar
  Email: s.kumar@kimbal.io
  Active Profile: work

# 2. Clone using authenticated helper
gclone https://github.com/sinhaludyog/devops.git

# 3. Start working
cd devops
git status
git commit -m "Fix bug"
git push  # Uses work credentials automatically ✅
```

### Cloning Personal Repository
```bash
# 1. Switch to personal profile
git-personal

# 2. Clone
gclone https://github.com/shivam2003-dev/my-project.git

# 3. Work on it
cd my-project
git commit -m "Update feature"
git push  # Uses personal credentials ✅
```

---

## 🔧 For Existing Repositories

If you already cloned a repo but can't push/pull:

### Fix Authentication
```bash
# 1. Check current profile
git config user.email

# 2. Switch if needed
git-work  # or git-personal

# 3. Update remote URL with token
cd ~/devops
TOKEN=$(github-token get work)
git remote set-url origin https://$TOKEN@github.com/sinhaludyog/devops.git

# 4. Test
git pull
git push
```

### Or Re-clone with Authentication
```bash
# Remove old clone
rm -rf ~/devops

# Clone with authentication
git-work
gclone https://github.com/sinhaludyog/devops.git
```

---

## 🔐 Using Git Credential Helper (macOS Keychain)

For better security, store credentials in macOS Keychain:

### Setup (One-time)
```bash
# Enable credential helper
git config --global credential.helper osxkeychain

# Clone any private repo
git clone https://github.com/sinhaludyog/devops.git

    # When prompted:
    # Username: shivamkumar-kimbal (or shivam2003-dev)
    # Password: [paste your token from: github-token get work]

    # Token is now saved! Future clones work automatically.
```

### Get Token for Manual Entry
```bash
# Get work token
github-token get work

# Get personal token
github-token get personal

# Or copy to clipboard (macOS)
github-token get work | pbcopy
```

---

## ⚙️ Available Commands

### Clone Commands
```bash
git-clone-auth <url>              # Clone with auto-authentication
gclone <url>                      # Shortcut
git-clone <url>                   # Alternative alias
gclone <url> <directory>          # Clone into specific directory
```

### Token Commands
```bash
github-token list                 # List all tokens
github-token get personal         # Get personal token
github-token get work             # Get work token
github-token test personal        # Test personal token
github-token test work            # Test work token
gh-token list                     # Shortcut
gh-token-personal                 # Get personal token
gh-token-work                     # Get work token
```

### Profile Commands
```bash
git-personal                      # Switch to personal
git-work                          # Switch to work
git-profile current               # Check current profile
git config user.email             # Verify email
```

---

## 🎯 Daily Workflow

### Morning - Work Projects
```bash
# Switch to work
git-work

# Clone work repo
cd ~/work
gclone https://github.com/sinhaludyog/devops.git

# Make changes
cd devops
git checkout -b feature/new-feature
# ... edit files ...
git add .
git commit -m "Add new feature"
git push origin feature/new-feature

# Email in commits: s.kumar@kimbal.io ✅
```

### Evening - Personal Projects
```bash
# Switch to personal
git-personal

# Clone personal repo
cd ~/personal
gclone https://github.com/shivam2003-dev/my-blog.git

# Make changes
cd my-blog
git add .
git commit -m "Update blog post"
git push

# Email in commits: shivam.sk2003@gmail.com ✅
```

---

## 🆘 Troubleshooting

### Issue: "Repository not found"
**Cause:** Either repo doesn't exist or your token doesn't have access

**Solution:**
```bash
# 1. Check if repo exists
curl -H "Authorization: token $(github-token get work)" \
     https://api.github.com/repos/sinhaludyog/devops

# 2. Test your token
github-token test work

# 3. Verify profile
git-profile current

# 4. Try cloning with authentication
gclone https://github.com/sinhaludyog/devops.git
```

### Issue: "Authentication failed" when pushing
**Solution 1:** Use git-clone-auth to re-clone
```bash
cd ~
rm -rf devops
gclone https://github.com/sinhaludyog/devops.git
```

**Solution 2:** Update remote URL
```bash
cd ~/devops
TOKEN=$(github-token get work)
git remote set-url origin https://$TOKEN@github.com/sinhaludyog/devops.git
git push
```

### Issue: Token exposed in git remote -v
**Solution:** This is normal when using token-based auth. To hide it:
```bash
# Option 1: Use SSH instead
git remote set-url origin git@github.com:sinhaludyog/devops.git

# Option 2: Use credential helper (recommended)
git config --global credential.helper osxkeychain
git remote set-url origin https://github.com/sinhaludyog/devops.git
# Next push will prompt for credentials (enter token as password)
```

### Issue: Wrong profile used for commit
**Solution:**
```bash
# Check current profile
git config user.email

# Switch profile
git-work  # or git-personal

# Amend last commit with correct email
git commit --amend --reset-author --no-edit
```

---

## 🔒 Security Best Practices

### Token Security
✅ **DO:**
- Use `git-clone-auth` - tokens are used but not exposed in shell history
- Use credential helper: `git config --global credential.helper osxkeychain`
- Rotate tokens regularly
- Use tokens with minimum required permissions

❌ **DON'T:**
- Share tokens in chat/email
- Commit tokens to repositories
- Use the same token for personal and work
- Give tokens more permissions than needed

### Profile Security
✅ **DO:**
- Verify profile before committing: `git config user.email`
- Use `git-personal` or `git-work` to switch
- Set up profile auto-detection warnings (already configured ✅)

❌ **DON'T:**
- Commit work code with personal email
- Push personal code to work repos
- Forget to switch profiles when changing contexts

---

## 📚 Additional Resources

- **Main docs:** `cat README.md`
- **Git profiles:** `cat GIT_PROFILES.md`
- **Quick reference:** `cat QUICKREF.md`
- **Status check:** `./status.sh`

---

## ✅ Success!

You successfully cloned the work repository:
```bash
✅ Using profile: work
✅ Repository: sinhaludyog/devops
✅ Successfully cloned!
✅ Local git config set for work profile
```

Now you can:
```bash
cd ~/devops
git status
# Make changes, commit, and push - all with work credentials! 🎉
```

**Happy coding!** 🚀
