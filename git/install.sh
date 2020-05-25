#!/bin/sh

if brew ls --versions git-lfs > /dev/null; then
  echo "[INFO] Skipped, git-lfs already installed"
else
  echo "[INFO] Installing git-lfs"
  brew install git-lfs
fi

git lfs install
git lfs install --system