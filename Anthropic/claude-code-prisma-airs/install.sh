#!/bin/bash

# Prisma AIRS Claude Code Hooks Installation Script
set -e

HOOKS_DIR="$HOME/.claude/hooks"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing Prisma AIRS security hooks for Claude Code..."

# Create hooks directory
mkdir -p "$HOOKS_DIR"
echo "✓ Created hooks directory: $HOOKS_DIR"

# Copy hook scripts
cp "$SCRIPT_DIR/hooks"/*.sh "$HOOKS_DIR/"
chmod +x "$HOOKS_DIR"/*.sh
echo "✓ Installed hook scripts"

# Copy example files
cp "$SCRIPT_DIR/example.env" "$HOOKS_DIR/airs.env"
echo "✓ Created environment template: $HOOKS_DIR/airs.env"

# Copy example settings
cp "$SCRIPT_DIR/settings.json" "$HOOKS_DIR/settings.example.json"
echo "✓ Created settings example: $HOOKS_DIR/settings.example.json"

echo ""
echo "Installation complete!"
echo ""
echo "Next steps:"
echo "1. Edit $HOOKS_DIR/airs.env with your AIRS credentials"
echo "2. Add environment variables to your shell profile:"
echo "   echo 'source $HOOKS_DIR/airs.env' >> ~/.zshrc"
echo "3. Update ~/.claude/settings.json with hook configuration"
echo "   (see $HOOKS_DIR/settings.example.json for reference)"
echo "4. Restart Claude Code"
echo ""
echo "For full documentation, see README.md"
