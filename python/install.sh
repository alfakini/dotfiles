#!/bin/sh

DOTFILES_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if brew ls --versions pyenv > /dev/null; then
  echo "[INFO] Skipped, pyenv already installed"
else
  echo "[INFO] Installing pyenv"
  brew install pyenv
fi

if brew ls --versions zlib > /dev/null; then
  echo "[INFO] Skipped, zlib already installed"
else
  echo "[INFO] Installing zlib"
  brew install zlib
  export LDFLAGS="-L/usr/local/opt/zlib/lib"
  export CPPFLAGS="-I/usr/local/opt/zlib/include"
  export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
fi

LATEST_PYTHON_VERSION=$(pyenv install --list | grep -v - | grep -v b | grep -v a | tail -1 | xargs)

echo "[INFO] Installing latest Python version ($LATEST_PYTHON_VERSION)"

pyenv install $LATEST_PYTHON_VERSION
pyenv global $LATEST_PYTHON_VERSION
