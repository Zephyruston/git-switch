# git-switch

A simple, config-based Git account switcher for managing multiple Git accounts with SSH keys.

## Features

- 🔄 **Config-based**: Add new accounts by editing a simple config file
- 🔑 **SSH key management**: Automatically configures SSH for each account
- 🌐 **Multi-provider**: Supports GitHub, Bitbucket, GitLab
- ⚡ **Instant switching**: Works immediately in current terminal
- 🛡️ **Secure**: Uses SSH config with `IdentitiesOnly` for security
- 📝 **Simple format**: Easy pipe-separated configuration

## Quick Start

```bash
# Clone the repository
git clone https://github.com/KaleLetendre/git-switch.git
cd git-switch

# Run installer
./install.sh

# Configure your accounts
vim ~/.config/git-switch/accounts.conf

# Switch accounts
git-switch
```

## Installation

### Method 1: Quick Install (Recommended)

```bash
curl -sSL https://raw.githubusercontent.com/KaleLetendre/git-switch/main/install.sh | bash
```

### Method 2: Manual Installation

1. Clone this repository
2. Copy `bin/git-switch` to somewhere in your PATH (e.g., `~/.local/bin/`)
3. Make it executable: `chmod +x ~/.local/bin/git-switch`
4. Create config directory: `mkdir -p ~/.config/git-switch`
5. Copy example config: `cp examples/accounts.conf ~/.config/git-switch/`
6. Edit config with your accounts: `vim ~/.config/git-switch/accounts.conf`

## Configuration

Edit `~/.config/git-switch/accounts.conf`:

```
# Format: name|email|ssh_key|description|hosts
Personal|john@example.com|~/.ssh/id_ed25519|Personal GitHub|github,bitbucket
Work|john@company.com|~/.ssh/id_ed25519_work|Work Account|github,gitlab
Client|john@client.com|~/.ssh/id_ed25519_client|Client Project|bitbucket
```

### Configuration Fields

- **name**: Account identifier (no spaces)
- **email**: Git commit email
- **ssh_key**: Path to SSH private key
- **description**: Human-readable description
- **hosts**: Comma-separated: `github`, `bitbucket`, `gitlab`

## Usage

```bash
# Run git-switch
git-switch

# Select account from menu
# 1) Personal (Personal GitHub - john@example.com)
# 2) Work (Work Account - john@company.com)
# 3) Client (Client Project - john@client.com)
# Enter choice (1-3): 2

# Now use git normally
git clone git@github.com:company/project.git
```

## Adding a New Account

### 1. Generate SSH Key

```bash
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_newaccount -C "your.email@company.com"
```

### 2. Add Public Key to Git Provider

```bash
# Copy public key
cat ~/.ssh/id_ed25519_newaccount.pub
```

Add to:
- **GitHub**: Settings → SSH and GPG keys → New SSH key
- **Bitbucket**: Personal settings → SSH keys → Add key
- **GitLab**: User Settings → SSH Keys

### 3. Add to Configuration

```bash
echo "NewAccount|your.email@company.com|~/.ssh/id_ed25519_newaccount|New Account Description|github,bitbucket" >> ~/.config/git-switch/accounts.conf
```

### 4. Switch to New Account

```bash
git-switch
# Select your new account
```

## How It Works

1. **Reads configuration** from `~/.config/git-switch/accounts.conf`
2. **Generates SSH config** with proper `IdentityFile` mappings
3. **Updates git config** with selected account's name and email
4. **No shell restart needed** - works immediately

### Technical Notes

- Handles config files without trailing newlines (common edge case)
- Extracts username from email if not explicitly provided
- Backs up original SSH config on first run

## Requirements

- Bash 4.0+
- Git
- SSH client
- Linux/macOS (WSL on Windows)

## Comparison with Alternatives

| Feature | git-switch | GitHub CLI | SSH Config Manual | git-acc |
|---------|------------|------------|-------------------|---------|
| Config-based | ✅ | ❌ | ❌ | ❌ |
| Multi-provider | ✅ | GitHub only | ✅ | ✅ |
| Auto-detection | ✅ | ❌ | ❌ | ❌ |
| No shell reload | ✅ | ✅ | ✅ | ❌ |
| Simple setup | ✅ | ✅ | ❌ | ⚠️ |

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Inspired by the need to manage multiple Git accounts efficiently
- Thanks to all contributors and users

## Support

- **Issues**: [GitHub Issues](https://github.com/KaleLetendre/git-switch/issues)
- **Discussions**: [GitHub Discussions](https://github.com/KaleLetendre/git-switch/discussions)

## Author

Kale Letendre - [@KaleLetendre](https://github.com/KaleLetendre)

---

⭐ If you find this tool useful, please star the repository!