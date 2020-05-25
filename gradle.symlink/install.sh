#!/bin/sh

if brew ls --versions java8 > /dev/null; then
  echo "[INFO] Skipped, java8 already installed"
else
  echo "[INFO] Installing java8"
  brew cask install java8
fi

brew install gradle
gradle --init-script ~/.gradle/init.gradle
