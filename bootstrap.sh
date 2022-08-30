#!/usr/bin/env bash

echo "Installing home-manager channel..."
nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz home-manager
nix-channel --update

echo "Installing GNU Make..."
nix-env --install gnumake
