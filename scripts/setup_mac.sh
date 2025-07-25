#!/bin/bash
# macOS setup script for Clueless project
# Installs Homebrew, PHP, Composer, and Node.js if not present, then installs dependencies

set -e

# Install Homebrew if missing
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install PHP, Composer, and Node via brew
echo "Installing PHP, Composer, and Node..."
brew install php composer node

# Determine project root relative to this script
SCRIPT_DIR="$(cd -- "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
cd "$PROJECT_ROOT"

# Install PHP dependencies
composer install

# Install Node dependencies
npm install

echo "Setup complete!"
echo "To start the development servers, run the following commands in separate terminals:"
echo "npm run dev    # start Vite"
echo "php artisan serve  # start Laravel backend"
