#!/usr/bin/env sh
set -eux

# https://github.com/nvim-lua/completion-nvim/issues/274#issuecomment-729961240

ROOT_DIR="$HOME/repos/neovim"
REPO_DIR="$HOME/repos/"
BUILD_DIR="$ROOT_DIR/build"
# SOURCE_DIR="$ROOT_DIR/src"

mkdir -p $REPO_DIR
rm -rf $ROOT_DIR

cd $REPO_DIR

git clone https://github.com/neovim/neovim --depth 1

cd "$ROOT_DIR"

git fetch --tags
git checkout v0.10.1

mkdir -p "$BUILD_DIR"

$HOMEBREW_PREFIX/bin/gmake CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=$BUILD_DIR GNUMAKEFLAGS="--jobs=8"
# rm -rf $BUILD_DIR
$HOMEBREW_PREFIX/bin/gmake install GNUMAKEFLAGS="--jobs=8"

cd -

ln -sf "$BUILD_DIR/bin/nvim" ~/bin/nvim
