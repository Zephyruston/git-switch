#!/bin/bash

# git-switch installer script

set -e

INSTALL_DIR="${HOME}/.local/bin"
CONFIG_DIR="${HOME}/.config/git-switch"
REPO_URL="https://github.com/KaleLetendre/git-switch.git"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Functions
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${YELLOW}ℹ${NC} $1"
}

# Header
echo "======================================"
echo "       git-switch installer"
echo "======================================"
echo ""

# Check dependencies
print_info "Checking dependencies..."

if ! command -v git &> /dev/null; then
    print_error "git is not installed. Please install git first."
    exit 1
fi

if ! command -v bash &> /dev/null; then
    print_error "bash is not installed. Please install bash first."
    exit 1
fi

print_success "All dependencies found"

# Create directories
print_info "Creating directories..."

mkdir -p "$INSTALL_DIR"
mkdir -p "$CONFIG_DIR"

print_success "Directories created"

# Download or copy git-switch
if [ -f "bin/git-switch" ]; then
    # Local installation from cloned repo
    print_info "Installing from local repository..."
    cp bin/git-switch "$INSTALL_DIR/git-switch"
    
    # Create config if it doesn't exist
    if [ ! -f "$CONFIG_DIR/accounts.conf" ]; then
        cat > "$CONFIG_DIR/accounts.conf" << 'CONF'
# Git Switch Accounts Configuration
# Add accounts with: git-switch -a
#
# Format: name|email|ssh_key|description|hosts
#
# Fields:
#   name: Account identifier (no spaces)
#   email: Git commit email address
#   ssh_key: Path to SSH private key
#   description: Human-readable description
#   hosts: Comma-separated list (github,bitbucket,gitlab)
#
# Example:
#   Personal|john@example.com|~/.ssh/id_ed25519|Personal GitHub|github,bitbucket

CONF
        print_success "Configuration created at $CONFIG_DIR/accounts.conf"
    else
        print_info "Configuration already exists at $CONFIG_DIR/accounts.conf"
    fi
else
    # Remote installation
    print_info "Downloading git-switch..."
    
    # Create temp directory
    TEMP_DIR=$(mktemp -d)
    cd "$TEMP_DIR"
    
    # Clone repository
    git clone "$REPO_URL" git-switch-temp &> /dev/null
    
    # Copy files
    cp git-switch-temp/bin/git-switch "$INSTALL_DIR/git-switch"
    
    # Create config if it doesn't exist
    if [ ! -f "$CONFIG_DIR/accounts.conf" ]; then
        cat > "$CONFIG_DIR/accounts.conf" << 'CONF'
# Git Switch Accounts Configuration
# Add accounts with: git-switch -a
#
# Format: name|email|ssh_key|description|hosts
#
# Fields:
#   name: Account identifier (no spaces)
#   email: Git commit email address
#   ssh_key: Path to SSH private key
#   description: Human-readable description
#   hosts: Comma-separated list (github,bitbucket,gitlab)
#
# Example:
#   Personal|john@example.com|~/.ssh/id_ed25519|Personal GitHub|github,bitbucket

CONF
        print_success "Configuration created at $CONFIG_DIR/accounts.conf"
    else
        print_info "Configuration already exists at $CONFIG_DIR/accounts.conf"
    fi
    
    # Cleanup
    rm -rf "$TEMP_DIR"
fi

# Make executable
chmod +x "$INSTALL_DIR/git-switch"
print_success "git-switch installed to $INSTALL_DIR/git-switch"

# Check if install directory is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    print_info "$INSTALL_DIR is not in your PATH"
    
    # Detect shell
    SHELL_RC=""
    if [ -n "$BASH_VERSION" ]; then
        SHELL_RC="$HOME/.bashrc"
    elif [ -n "$ZSH_VERSION" ]; then
        SHELL_RC="$HOME/.zshrc"
    fi
    
    if [ -n "$SHELL_RC" ]; then
        echo ""
        print_info "Add the following line to your $SHELL_RC:"
        echo ""
        echo "    export PATH=\"\$PATH:$INSTALL_DIR\""
        echo ""
        print_info "Or run this command to add it automatically:"
        echo ""
        echo "    echo 'export PATH=\"\$PATH:$INSTALL_DIR\"' >> $SHELL_RC"
        echo ""
    fi
else
    print_success "$INSTALL_DIR is already in PATH"
fi

# Final instructions
echo ""
echo "======================================"
echo "       Installation complete!"
echo "======================================"
echo ""
echo "Next steps:"
echo "1. Run 'git-switch -a' to add an account"
echo "2. Run 'git-switch' to switch between accounts"
echo ""
echo "Run 'git-switch -h' for all available commands."