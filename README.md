# git-switch

If you work across multiple Git accounts (personal, work, client projects, etc.), you normally have to deal with SSH host aliases or prefixes on every git command to use the right identity. git-switch lets you switch between accounts with a single command, it handles your SSH config and git user settings so you can just use git normally.

## Features

- Config-based account management via a simple pipe-separated file
- Automatic SSH config generation with `IdentitiesOnly` enforcement
- Supports GitHub, Bitbucket, and GitLab
- Works immediately in the current terminal (no shell restart)

## Quick Start

```bash
# Clone the repository
git clone https://github.com/KaleLetendre/git-switch.git
cd git-switch

# Run installer
./install.sh

# Add an account
git-switch -a

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

## Adding an Account

Before adding an account, you need an SSH key for it. If you already have one, skip to step 3.

### 1. Generate SSH Key

```bash
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_myaccount -C "your.email@example.com"
```

### 2. Add Public Key to Git Provider

```bash
cat ~/.ssh/id_ed25519_myaccount.pub
```

Copy the output and add it to your provider:
- **GitHub**: [SSH and GPG keys](https://github.com/settings/keys)
- **Bitbucket**: [SSH keys](https://bitbucket.org/account/settings/ssh-keys/)
- **GitLab**: [SSH Keys](https://gitlab.com/-/user_settings/ssh_keys)

### 3. Add to git-switch

```bash
git-switch -a
```

This will prompt you for the account name, email, SSH key path, description, and hosts.

## Usage

```bash
git-switch
```

Select an account from the menu, then use git normally:

```
1) Personal (Personal GitHub - john@example.com)
2) Work (Work Account - john@company.com)
Enter choice (1-2): 1
```

## Configuration

Accounts are stored in `~/.config/git-switch/accounts.conf`. You can also edit this file directly:

```
# Format: name|email|ssh_key|description|hosts
Personal|john@example.com|~/.ssh/id_ed25519|Personal GitHub|github,bitbucket
Work|john@company.com|~/.ssh/id_ed25519_work|Work Account|github,gitlab
```

Fields:
- **name**: Account identifier (no spaces), shown in the menu
- **email**: Git commit email
- **ssh_key**: Path to SSH private key
- **description**: Shown next to the name in the menu
- **hosts**: Comma-separated: `github`, `bitbucket`, `gitlab`

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

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

- **Issues**: [GitHub Issues](https://github.com/KaleLetendre/git-switch/issues)
- **Discussions**: [GitHub Discussions](https://github.com/KaleLetendre/git-switch/discussions)

## Author

Kale Letendre - [@KaleLetendre](https://github.com/KaleLetendre)

---

⭐ If you find this tool useful, please star the repository!