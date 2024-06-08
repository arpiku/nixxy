{ pkgs ? import <nixpkgs> {} }:

# TODO: Create a flake to lock down code version


pkgs.mkShell {
  buildInputs = [
    #pkgs.vim # TODO: For developing a very minimal workstation setup in future by just using nixxy
  
    #For Haskell
    pkgs.ghc

    # This is for building st (suckless terminal)
    pkgs.xorg.libX11
    pkgs.xorg.libXft
    pkgs.pkg-config

    #This is to build tmux
    pkgs.automake
    pkgs.autoconf
    pkgs.libevent
    pkgs.pkg-config
    pkgs.byacc
    pkgs.ncurses
  ];

  shellHook = ''
    echo "Welcome to the Nixxy development environment!"
  '';
}

