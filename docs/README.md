# 📚 Documentation Index

All documentation for the dotfiles is organized here.

## 📖 Main Documentation

### Getting Started
- **[Installation Guide](INSTALLATION.md)** - Complete setup instructions
- **[Quick Start Demo](QUICKSTART.sh)** - Try it out! (run `./docs/QUICKSTART.sh`)

### Core Features
- **[Git Profiles Guide](GIT_PROFILES.md)** - Manage personal/work git profiles
- **[Git Authentication](GIT_AUTH_GUIDE.md)** - Setup authenticated cloning
- **[GitHub Workflow](GIT_GITHUB_GUIDE.md)** - GitHub best practices
- **[Help & Environment](HELP_ENV_GUIDE.md)** - Using help system and .env config

### Security
- **[Security Audit](SECURITY_AUDIT.md)** - Security status and protections
- **[What Changed](WHAT_CHANGED.md)** - Security fixes applied

## 🚀 Demo Scripts

Run these to see features in action:

```bash
./docs/QUICKSTART.sh           # Quick demo of all features
./docs/FEATURE_DEMO.sh         # Detailed feature demonstrations
./docs/ENV_DRIVEN_CHANGES.sh   # Environment configuration demo
./docs/TOKEN_MANAGEMENT.sh     # Token management walkthrough
./docs/HELP_QUICK_REF.sh       # Command quick reference
```

## 📤 GitHub Upload

- **[Quick Upload Guide](QUICK_UPLOAD.sh)** - Quick reference (run `./docs/QUICK_UPLOAD.sh`)
- **[Detailed Upload Guide](GITHUB_UPLOAD_GUIDE.sh)** - Step-by-step instructions
- **[Final Summary](README_FINAL.sh)** - Complete overview (run `./docs/README_FINAL.sh`)

## 🎯 Quick Links

### I want to...
- **Install everything** → See [INSTALLATION.md](INSTALLATION.md)
- **Switch git profiles** → See [GIT_PROFILES.md](GIT_PROFILES.md)
- **Clone private repos** → See [GIT_AUTH_GUIDE.md](GIT_AUTH_GUIDE.md)
- **Learn aliases** → Run `help` or see [HELP_QUICK_REF.sh](HELP_QUICK_REF.sh)
- **Upload to GitHub** → Run `./docs/QUICK_UPLOAD.sh`
- **Check security** → Run `./bin/scan-secrets`

## 📂 File Organization

```
dotfile/
├── README.md              # Main readme (in root)
├── .env.example           # Environment template
├── .zshrc, .tmux.conf     # Config files (in root)
├── bin/                   # Executable scripts
│   ├── help               # Help system
│   ├── scan-secrets       # Security scanner
│   ├── git-profile        # Profile switcher
│   └── ...
└── docs/                  # All documentation (YOU ARE HERE)
    ├── README.md          # This file
    ├── INSTALLATION.md    # Setup guide
    ├── *.md               # All markdown docs
    └── *.sh               # Demo scripts
```

## 🔍 Search Tips

Find commands quickly:
```bash
help all | grep <keyword>        # Search all aliases
help git                         # Git commands
help kubernetes                  # K8s commands
help security                    # Security tools
```

---

**Back to:** [Main README](../README.md)
