#!/bin/bash

set -e
pushd ~/dotfiles/nixos/
hx config.nix
alejandra . &>/dev/null
git diff -U0 *.nix
echo "NixOS REbuilding"
sudo nixos-rebuild switch &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)
gen = $(nixos-rebuild list-generations | grep current)
git commit -am "$gen"
popd
