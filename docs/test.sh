#!/usr/bin/env bash

# ================================
# Dotfiles Test Script
# Tests all components of the dotfiles setup
# ================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

PASS=0
FAIL=0

print_header() {
    echo -e "\n${BLUE}==================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}==================================${NC}\n"
}

test_pass() {
    echo -e "${GREEN}✅ PASS:${NC} $1"
    ((PASS++))
}

test_fail() {
    echo -e "${RED}❌ FAIL:${NC} $1"
    ((FAIL++))
}

test_info() {
    echo -e "${YELLOW}ℹ️  INFO:${NC} $1"
}

# ================================
# Test 1: Check File Existence
# ================================

print_header "Test 1: File Existence"

files=(
    ".zshrc"
    ".tmux.conf"
    ".gitconfig"
    ".gitignore_global"
    ".aliases"
    ".functions"
    ".exports"
    ".gitmessage"
    ".ripgreprc"
    "setup.sh"
    "uninstall.sh"
    "README.md"
    "GIT_PROFILES.md"
    "QUICKREF.md"
    "bin/git-profile"
    "bin/git-profile-setup"
    "nvim/init.lua"
    "nvim/lua/config/options.lua"
    "nvim/lua/config/keymaps.lua"
    "nvim/lua/config/autocmds.lua"
    "nvim/lua/plugins/devsecops.lua"
)

for file in "${files[@]}"; do
    if [ -f "$file" ] || [ -d "$file" ]; then
        test_pass "File exists: $file"
    else
        test_fail "File missing: $file"
    fi
done

# ================================
# Test 2: Script Permissions
# ================================

print_header "Test 2: Script Permissions"

scripts=(
    "setup.sh"
    "uninstall.sh"
    "bin/git-profile"
    "bin/git-profile-setup"
)

for script in "${scripts[@]}"; do
    if [ -x "$script" ]; then
        test_pass "Script is executable: $script"
    else
        test_fail "Script not executable: $script"
    fi
done

# ================================
# Test 3: File Syntax
# ================================

print_header "Test 3: File Syntax"

# Test shell scripts
if bash -n setup.sh 2>/dev/null; then
    test_pass "setup.sh syntax is valid"
else
    test_fail "setup.sh has syntax errors"
fi

if bash -n uninstall.sh 2>/dev/null; then
    test_pass "uninstall.sh syntax is valid"
else
    test_fail "uninstall.sh has syntax errors"
fi

if bash -n bin/git-profile 2>/dev/null; then
    test_pass "git-profile syntax is valid"
else
    test_fail "git-profile has syntax errors"
fi

# Test zsh config (basic check)
if zsh -n .zshrc 2>/dev/null; then
    test_pass ".zshrc syntax is valid"
else
    test_fail ".zshrc has syntax errors"
fi

# ================================
# Test 4: Git Profile System
# ================================

print_header "Test 4: Git Profile System"

# Test git-profile command
if ./bin/git-profile list &>/dev/null; then
    test_pass "git-profile command works"
else
    test_fail "git-profile command failed"
fi

# Test git-profile init
if ./bin/git-profile init &>/dev/null; then
    test_pass "git-profile init works"
else
    test_fail "git-profile init failed"
fi

# Check if profile directory exists
if [ -d "$HOME/.git-profiles" ]; then
    test_pass "Git profiles directory created"
else
    test_fail "Git profiles directory not created"
fi

# Check profile templates
if [ -f "$HOME/.git-profiles/personal" ]; then
    test_pass "Personal profile template exists"
else
    test_fail "Personal profile template missing"
fi

if [ -f "$HOME/.git-profiles/work" ]; then
    test_pass "Work profile template exists"
else
    test_fail "Work profile template missing"
fi

# ================================
# Test 5: Configuration Files Content
# ================================

print_header "Test 5: Configuration Files Content"

# Check .zshrc for essential components
if grep -q "oh-my-zsh" .zshrc; then
    test_pass ".zshrc contains oh-my-zsh configuration"
else
    test_fail ".zshrc missing oh-my-zsh configuration"
fi

if grep -q "plugins=" .zshrc; then
    test_pass ".zshrc contains plugins configuration"
else
    test_fail ".zshrc missing plugins configuration"
fi

if grep -q "git-profile" .zshrc; then
    test_pass ".zshrc contains git-profile integration"
else
    test_fail ".zshrc missing git-profile integration"
fi

# Check .aliases for DevSecOps commands
essential_aliases=("kubectl" "docker" "terraform" "git-personal" "git-work")
for alias_cmd in "${essential_aliases[@]}"; do
    if grep -q "$alias_cmd" .aliases; then
        test_pass ".aliases contains $alias_cmd"
    else
        test_fail ".aliases missing $alias_cmd"
    fi
done

# Check .functions for DevSecOps functions
essential_functions=("kgetall" "dscan" "secscan" "git_profile_check")
for func in "${essential_functions[@]}"; do
    if grep -q "$func" .functions .zshrc 2>/dev/null; then
        test_pass "Function $func is defined"
    else
        test_fail "Function $func is missing"
    fi
done

# ================================
# Test 6: Tmux Configuration
# ================================

print_header "Test 6: Tmux Configuration"

if grep -q "set -g prefix C-a" .tmux.conf; then
    test_pass ".tmux.conf has custom prefix (Ctrl+A)"
else
    test_fail ".tmux.conf missing custom prefix"
fi

if grep -q "tpm" .tmux.conf; then
    test_pass ".tmux.conf has TPM plugin manager"
else
    test_fail ".tmux.conf missing TPM"
fi

# ================================
# Test 7: Neovim Configuration
# ================================

print_header "Test 7: Neovim Configuration"

if [ -f "nvim/init.lua" ]; then
    test_pass "Neovim init.lua exists"
else
    test_fail "Neovim init.lua missing"
fi

if grep -q "LazyVim" nvim/init.lua; then
    test_pass "Neovim configured with LazyVim"
else
    test_fail "Neovim missing LazyVim configuration"
fi

# Check for DevSecOps language support
devsecops_langs=("docker" "terraform" "python" "yaml")
for lang in "${devsecops_langs[@]}"; do
    if grep -q "$lang" nvim/init.lua; then
        test_pass "Neovim has $lang support"
    else
        test_fail "Neovim missing $lang support"
    fi
done

# ================================
# Test 8: Git Configuration
# ================================

print_header "Test 8: Git Configuration"

if grep -q "delta" .gitconfig; then
    test_pass ".gitconfig has delta diff viewer"
else
    test_fail ".gitconfig missing delta"
fi

if grep -q "alias" .gitconfig; then
    test_pass ".gitconfig has aliases"
else
    test_fail ".gitconfig missing aliases"
fi

# ================================
# Test 9: Documentation
# ================================

print_header "Test 9: Documentation"

if [ -f "README.md" ] && [ -s "README.md" ]; then
    test_pass "README.md exists and is not empty"
else
    test_fail "README.md is missing or empty"
fi

if [ -f "GIT_PROFILES.md" ] && [ -s "GIT_PROFILES.md" ]; then
    test_pass "GIT_PROFILES.md exists and is not empty"
else
    test_fail "GIT_PROFILES.md is missing or empty"
fi

if [ -f "QUICKREF.md" ] && [ -s "QUICKREF.md" ]; then
    test_pass "QUICKREF.md exists and is not empty"
else
    test_fail "QUICKREF.md is missing or empty"
fi

# ================================
# Test 10: Directory Structure
# ================================

print_header "Test 10: Directory Structure"

dirs=(
    "bin"
    "nvim"
    "nvim/lua"
    "nvim/lua/config"
    "nvim/lua/plugins"
)

for dir in "${dirs[@]}"; do
    if [ -d "$dir" ]; then
        test_pass "Directory exists: $dir"
    else
        test_fail "Directory missing: $dir"
    fi
done

# ================================
# Summary
# ================================

print_header "Test Summary"

TOTAL=$((PASS + FAIL))
echo -e "${BLUE}Total Tests:${NC} $TOTAL"
echo -e "${GREEN}Passed:${NC} $PASS"
echo -e "${RED}Failed:${NC} $FAIL"
echo ""

if [ $FAIL -eq 0 ]; then
    echo -e "${GREEN}🎉 All tests passed!${NC}"
    echo -e "${GREEN}✅ Dotfiles are ready to use!${NC}"
    echo ""
    echo -e "${BLUE}Next steps:${NC}"
    echo "  1. Run: ./setup.sh (to install)"
    echo "  2. Run: git-profile-setup (to configure git profiles)"
    echo "  3. Restart your terminal"
    exit 0
else
    echo -e "${RED}⚠️  Some tests failed!${NC}"
    echo -e "${YELLOW}Please review the failures above.${NC}"
    exit 1
fi
