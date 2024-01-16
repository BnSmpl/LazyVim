# Mikas Notizen

## Install Neovim
https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-source

git clone 

make CMAKE_BUILD_TYPE=Release
sudo make install

rm -r build/  # clear the CMake cache
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
make install
export PATH="$HOME/neovim/bin:$PATH"

# Uninstall Neovim
sudo cmake --build build/ --target uninstall




# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Install LazyVim

# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim/

nvim
