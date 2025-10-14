# 🔧 TROUBLESHOOTING GUIDE

## Common Issues and Solutions

### ❌ Issue: `help docker` shows "no such file or directory"

**Cause:** Zsh is caching old aliases from previous installation

**Solution:**
```bash
# Run the force fix script
cd ~/Desktop/dotfile  # Or wherever you cloned the repo
./FORCE_FIX.sh

# Then CLOSE terminal completely and open a NEW one
# Do NOT use 'exec zsh' or 'source ~/.zshrc'
```

---

### ❌ Issue: `.functions:361: parse error near ;;`

**Cause:** Syntax error in .functions file

**Solution:**
```bash
# Run the force fix script - it fixes this automatically
./FORCE_FIX.sh

# Or manually fix:
sed -i.bak 's/<registry-name>/registry-name/g' ~/.dotfiles/.functions
```

---

### ❌ Issue: Changes not taking effect after `source ~/.zshrc`

**Cause:** Zsh caches functions and aliases. `source` doesn't clear the cache.

**Solution:**
```bash
# Method 1: Close terminal and open NEW one (RECOMMENDED)
# Just close the terminal app and reopen it

# Method 2: Clear cache first, then reload
rm -f ~/.zcompdump*
exec zsh
```

---

### ❌ Issue: `help` command not working after installation

**Symptoms:**
- `zsh: no such file or directory: ~/Desktop/dotfile/bin/help`
- Even after running setup.sh

**Root Cause:** 
- Zsh caches aliases on startup
- Old aliases are still in memory
- `source ~/.zshrc` doesn't clear cached aliases

**Complete Fix:**

1. **Run the force fix script:**
   ```bash
   cd ~/Desktop/dotfile
   chmod +x FORCE_FIX.sh
   ./FORCE_FIX.sh
   ```

2. **CRITICAL: Close terminal completely**
   - Do NOT use `exec zsh`
   - Do NOT use `source ~/.zshrc`
   - Close the terminal app
   - Open a brand new terminal window

3. **Test:**
   ```bash
   help docker
   help kubernetes
   ```

---

### ❌ Issue: After `uninstall.sh`, `setup.sh` doesn't work

**Solution:**
```bash
# Use CLEAN_INSTALL.sh instead
cd ~/Desktop/dotfile
chmod +x CLEAN_INSTALL.sh
./CLEAN_INSTALL.sh

# Then close terminal and open new one
```

---

### ❌ Issue: Paths still pointing to `~/Desktop/dotfile`

**Cause:** Old installation wasn't cleaned properly

**Solution:**
```bash
# Run complete reinstall
cd ~/Desktop/dotfile
./CLEAN_INSTALL.sh

# Close terminal and open new one
```

---

## 🔍 Debugging Commands

Check current configuration:
```bash
# See what DOTFILES_DIR is set to
echo $DOTFILES_DIR
# Should show: /Users/yourname/.dotfiles

# Check if help exists and is executable
ls -la ~/.dotfiles/bin/help
# Should show: -rwxr-xr-x

# Check what help alias points to
alias help
# Should show: alias help="${DOTFILES_DIR}/bin/help"

# Check symlinks
ls -la ~/.zshrc
# Should show: ~/.zshrc -> /Users/yourname/.dotfiles/.zshrc
```

---

## 📋 Clean Installation Procedure

If everything is broken, start fresh:

```bash
# 1. Go to dotfiles directory
cd ~/Desktop/dotfile

# 2. Run clean install
chmod +x CLEAN_INSTALL.sh
./CLEAN_INSTALL.sh

# 3. CLOSE terminal completely (don't use exec zsh!)

# 4. Open NEW terminal

# 5. Test
help docker

# 6. If still broken, run force fix
cd ~/Desktop/dotfile
./FORCE_FIX.sh

# 7. Close terminal and open new one again
```

---

## 🚨 Emergency Reset

If nothing works:

```bash
# 1. Remove everything
rm -rf ~/.dotfiles
rm -f ~/.zshrc ~/.tmux.conf ~/.gitconfig
rm -f ~/.aliases ~/.functions ~/.exports
rm -f ~/.zcompdump*
rm -rf ~/.zsh/cache

# 2. Clone fresh
git clone https://github.com/highlevel-performance/dotfile.git ~/Desktop/dotfile

# 3. Run clean install
cd ~/Desktop/dotfile
./CLEAN_INSTALL.sh

# 4. Close terminal completely and open new one
```

---

## ✅ Verification Steps

After installation, verify everything:

```bash
# 1. Check installation
ls -la ~/.dotfiles/bin/help
# Should exist and be executable

# 2. Check symlinks
readlink ~/.zshrc
# Should show: /Users/yourname/.dotfiles/.zshrc

# 3. Check environment variable
echo $DOTFILES_DIR
# Should show: /Users/yourname/.dotfiles

# 4. Check help command
which help
# Should show: help: aliased to ${DOTFILES_DIR}/bin/help

# 5. Test help
help docker
# Should show Docker commands

# 6. Check PATH
echo $PATH | tr ':' '\n' | grep dotfiles
# Should show: /Users/yourname/.dotfiles/bin
```

---

## 💡 Why Terminal Restart is Required

**Key Point:** Zsh caches aliases, functions, and commands when it starts.

When you run `source ~/.zshrc`:
- ✅ Variables are reloaded
- ✅ New aliases are defined
- ❌ OLD aliases are NOT removed from cache
- ❌ Old functions stay in memory

When you open a NEW terminal:
- ✅ Fresh zsh process
- ✅ Clean cache
- ✅ All aliases loaded from .zshrc
- ✅ No old values in memory

**This is why `exec zsh` or `source ~/.zshrc` doesn't fix path issues!**

---

## 📞 Still Having Issues?

1. Check this file: `~/.dotfiles/bin/help` - does it exist?
2. Is it executable? `ls -la ~/.dotfiles/bin/help`
3. What does `echo $DOTFILES_DIR` show?
4. What does `alias help` show?
5. Did you CLOSE the terminal and open a NEW one?

If you answered "no" to #5, that's your problem! 😊

---

## 🎯 Quick Reference

| Problem | Solution |
|---------|----------|
| `help` not found | Run `FORCE_FIX.sh`, close terminal, open new one |
| Parse error in .functions | Run `FORCE_FIX.sh` |
| Changes not applying | CLOSE terminal, open NEW one (don't use exec/source) |
| Wrong paths | Run `CLEAN_INSTALL.sh` |
| Everything broken | Follow "Emergency Reset" above |

---

**Remember: When in doubt, close terminal and open a new one!** 🚀
