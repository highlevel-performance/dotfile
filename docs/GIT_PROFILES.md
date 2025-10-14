# Git Profile Management Guide

## Overview

This dotfiles setup includes a powerful Git profile switcher that allows you to seamlessly switch between personal and work Git configurations. This prevents accidentally committing to work repos with your personal email (or vice versa).

## Features

✅ **Multiple Git Profiles**: Separate configurations for personal and work  
✅ **Quick Switching**: Simple commands to switch between profiles  
✅ **Repository-Specific**: Set different profiles for specific repositories  
✅ **Auto-Detection**: Warns you if you're in a work directory with personal profile  
✅ **SSH Key Management**: Different SSH keys for different profiles  
✅ **GPG Signing**: Separate GPG keys for each profile  

## Quick Start

### 1. Initial Setup

Run the setup helper to configure your profiles:

```bash
git-profile-setup
```

This will guide you through creating:
- Personal profile (name, email, GitHub username, SSH key)
- Work profile (name, email, work username, SSH key)

### 2. Manual Setup (Alternative)

If you prefer manual setup, edit the profile files directly:

```bash
# Edit personal profile
nvim ~/.git-profiles/personal

# Edit work profile
nvim ~/.git-profiles/work
```

Profile template:
```ini
[user]
    name = Your Name
    email = your.email@example.com
    signingkey = GPG_KEY_ID

[github]
    user = your-github-username

[core]
    sshCommand = ssh -i ~/.ssh/id_rsa -F /dev/null
```

## Usage

### Switch Global Profile

These commands change your global Git configuration:

```bash
# Switch to personal profile
git-personal

# Switch to work profile
git-work

# Alternative syntax
git-profile use personal
git-profile use work
```

### Set Profile for Current Repository Only

Use this when you want a specific repo to use a different profile than your global setting:

```bash
# Set personal profile for current repo
git-profile local personal

# Set work profile for current repo
git-profile local work
```

### Check Current Profile

```bash
# Show current active profile
git-current
git-profile current
git-profile status

# List all available profiles
git-profiles
git-profile list
```

### Edit Profiles

```bash
# Edit personal profile
git-profile edit personal

# Edit work profile
git-profile edit work
```

## Workflow Examples

### Example 1: Working on Personal Projects

```bash
# Set personal as default
git-personal

# Clone and work on personal repos
cd ~/personal
git clone git@github.com:yourusername/my-project.git
cd my-project
# Commits will use your personal email
```

### Example 2: Working on Work Projects

```bash
# Switch to work profile
git-work

# Clone and work on work repos
cd ~/work
git clone git@github.com:company/work-project.git
cd work-project
# Commits will use your work email
```

### Example 3: Mixed Environment

```bash
# Set work as global default
git-work

# But for a specific personal repo in work folder
cd ~/work/my-side-project
git-profile local personal
# This repo will use personal email, others use work
```

## SSH Key Management

### Setting Up Separate SSH Keys

1. **Generate separate SSH keys:**

```bash
# Personal key
ssh-keygen -t ed25519 -C "personal@email.com" -f ~/.ssh/id_rsa_personal

# Work key
ssh-keygen -t ed25519 -C "work@company.com" -f ~/.ssh/id_rsa_work
```

2. **Add keys to SSH agent:**

```bash
ssh-add ~/.ssh/id_rsa_personal
ssh-add ~/.ssh/id_rsa_work
```

3. **Add public keys to GitHub/GitLab:**

```bash
# Copy personal key
cat ~/.ssh/id_rsa_personal.pub | pbcopy

# Copy work key
cat ~/.ssh/id_rsa_work.pub | pbcopy
```

4. **Update your profiles:**

Edit `~/.git-profiles/personal`:
```ini
[core]
    sshCommand = ssh -i ~/.ssh/id_rsa_personal -F /dev/null
```

Edit `~/.git-profiles/work`:
```ini
[core]
    sshCommand = ssh -i ~/.ssh/id_rsa_work -F /dev/null
```

## Auto-Detection & Warnings

The system automatically checks your current directory when you:
- Change directories
- Open a new terminal

It will warn you if:
- You're in a directory with "work" in the path but using personal profile
- You're in a directory with "personal" in the path but using work profile

Example warning:
```
⚠️  Warning: You're in a work directory but using PERSONAL git profile!
   Run 'git-work' to switch to work profile
```

## GPG Signing

### Setup GPG Keys

1. **Generate GPG keys:**

```bash
# Generate personal key
gpg --full-generate-key

# List keys to get key ID
gpg --list-secret-keys --keyid-format=long
```

2. **Export public key for GitHub/GitLab:**

```bash
gpg --armor --export YOUR_KEY_ID | pbcopy
```

3. **Add to your profile:**

```ini
[user]
    signingkey = YOUR_KEY_ID
```

4. **Configure GPG in gitconfig:**

Already configured in the main `.gitconfig`:
```ini
[commit]
    gpgsign = true
```

## Troubleshooting

### Check Current Configuration

```bash
# See what Git sees
git config --list | grep user

# Check current profile
git-profile current
```

### Profile Not Switching

```bash
# Reinitialize profiles
git-profile init

# Manually switch
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

### SSH Key Issues

```bash
# Test SSH connection
ssh -T git@github.com -i ~/.ssh/id_rsa_personal

# Check SSH agent
ssh-add -l
```

### Permission Issues

```bash
# Make scripts executable
chmod +x ~/Desktop/dotfile/bin/git-profile
chmod +x ~/Desktop/dotfile/bin/git-profile-setup
```

## Advanced Usage

### Create Additional Profiles

```bash
# Create a new profile
nvim ~/.git-profiles/client1

# Use it
git-profile use client1
```

### Conditional Git Config (Alternative Method)

You can also use Git's conditional includes in `~/.gitconfig`:

```ini
# Default to work
[include]
    path = ~/.git-profiles/work

# Use personal for personal projects
[includeIf "gitdir:~/personal/"]
    path = ~/.git-profiles/personal

# Use personal for specific client
[includeIf "gitdir:~/projects/client-xyz/"]
    path = ~/.git-profiles/personal
```

## Best Practices

1. **Set a Default**: Choose work or personal as your global default
2. **Use Local Overrides**: Use `git-profile local` for exceptions
3. **Check Before Committing**: Run `git-current` if unsure
4. **Separate Directories**: Keep work and personal projects in different folders
5. **Regular Audits**: Occasionally check `git log` to verify correct email is used

## Integration with Other Tools

### VS Code

Add to VS Code settings:
```json
{
  "git.confirmSync": false,
  "git.autofetch": true
}
```

### IDE Integration

Most IDEs respect Git config, so switching profiles works automatically.

## Command Reference

```bash
git-profile init              # Initialize profile templates
git-profile use <profile>     # Switch global profile
git-profile local <profile>   # Set profile for current repo
git-profile list              # List all profiles
git-profile current           # Show current profile
git-profile edit <profile>    # Edit a profile

# Shortcuts
git-personal                  # Switch to personal
git-work                      # Switch to work
git-current                   # Show current profile
git-profiles                  # List profiles
```

## Files & Directories

```
~/.git-profiles/              # Profile storage directory
  ├── personal                # Personal profile config
  └── work                    # Work profile config
~/.git-profile-current        # Current active profile marker
~/Desktop/dotfile/bin/
  ├── git-profile             # Main switcher script
  └── git-profile-setup       # Setup helper script
```
