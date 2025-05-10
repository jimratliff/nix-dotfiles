#!/bin/zsh
set -euo pipefail

FLAKE_DIR="/Users/nix-admin/.nix-config"
REMOTE="origin"
BRANCH="main"

cd "$FLAKE_DIR" || {
  echo "❌ Could not find flake directory: $FLAKE_DIR"
  exit 1
}

# Attempt to fetch from remote
echo "🌐 Checking for network connectivity to remote flake..."
if git ls-remote --exit-code "$REMOTE" &>/dev/null; then
  echo "🔄 Pulling latest changes from $REMOTE/$BRANCH..."
  git pull "$REMOTE" "$BRANCH"
else
  echo "⚠️  Could not reach remote repository. Proceeding with local flake copy."
fi

# Apply the flake
echo "⚙️ Applying system configuration from local flake..."
darwin-rebuild switch --flake "$FLAKE_DIR"

echo "✅ System configuration applied successfully."
