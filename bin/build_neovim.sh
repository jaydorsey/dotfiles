#!/usr/bin/env sh
set -eux

# https://github.com/nvim-lua/completion-nvim/issues/274#issuecomment-729961240

ROOT_DIR="$HOME/repos/neovim"
REPO_DIR="$HOME/repos/"
BUILD_DIR="$ROOT_DIR/build"
SOURCE_DIR="$ROOT_DIR/src"

mkdir -p ~/repos
rm -rf ~/repos/neovim

cd $REPO_DIR
git clone https://github.com/neovim/neovim

# git clone https://github.com/neovim/neovim

mkdir -p $BUILD_DIR

cd $ROOT_DIR

/usr/local/bin/gmake CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=$BUILD_DIR GNUMAKEFLAGS="--jobs=8"
# rm -rf $BUILD_DIR
/usr/local/bin/gmake install GNUMAKEFLAGS="--jobs=8"

cd -

ln -sf "$BUILD_DIR/bin/nvim" ~/bin/nvim
