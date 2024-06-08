{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
  pkgs.xorg.libX11
  pkgs.xorg.libXft
  pkgs.pkg-config
  ];

  shellHook = ''
    echo "Welcome to the Haskell development environment!"
  '';
}

