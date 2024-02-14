#!/bin/bash

# Update package list and install dependencies
sudo apt-get update
sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl git

# Check if the 'neovim' directory exists and is a git repository
if [ -d "neovim/.git" ]; then
    echo "'neovim' directory exists and is a git repository. Pulling latest changes..."
    cd neovim || exit
    git pull
    cd ..
else
    if [ -d "neovim" ]; then
        # Backup the existing 'neovim' directory if it's not a git repository
        echo "'neovim' directory exists but is not a git repository. Backing up..."
        mv neovim "neovim.bak_$(date +%Y%m%d_%H%M%S)"
    fi
    # Clone Neovim
    git clone --origin neovim https://github.com/neovim/neovim.git || { echo "Git clone of Neovim failed"; exit 1; }
fi

# build
cd neovim || { echo "Failed to enter the neovim directory"; exit 1; }
git checkout stable
make CMAKE_BUILD_TYPE=Release || { echo "Neovim build failed"; exit 1; }
sudo make install || { echo "Neovim installation failed"; exit 1; }

# Check Neovim installation
nvim --version || { echo "Neovim installation check failed"; exit 1; }

# Install Lazyvim
if [ -d "$HOME/.config/nvim" ]; then
    mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak_$(date +%Y%m%d_%H%M%S)"
fi
git clone https://github.com/LazyVim/starter "$HOME/.config/nvim/" || { echo "Lazyvim clone failed"; exit 1; }

echo "Neovim installation complete. Please run 'nvim' to start Neovim with Lazyvim configuration."
