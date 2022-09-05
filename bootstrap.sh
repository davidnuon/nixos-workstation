#!/usr/bin/env bash

set -euo pipefail

echo "Installing home-manager channel..."
nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz home-manager
nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
nix-shell '<home-manager>' -A install

echo "Making home-manager directory..."
mkdir -pv "$HOME/.config/nixpkgs"

echo "Installing GNU Make..."
nix-env --install gnumake