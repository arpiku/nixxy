{ pkgs ? import <nixpkgs> {} }:

# TODO: Create a flake to lock down code version


pkgs.mkShell {
  buildInputs = [
    #pkgs.vim # TODO: For developing a very minimal workstation setup in future by just using nixxy
  
    #For Haskell
    pkgs.ghc

    pkgs.cabal-install

    pkgs.gtk3

    # pkgs.keybinder3
    # pkgs.libnotify
    # pkgs.python311Packages.pycairo
    # pkgs.python311Packages.pygobject3
    # pkgs.python311Packages.configobj
    # pkgs.python311Packages.psutil




    #  I will get back to this someday (but today I need to move forward)
    # pkgs.
    pkgs.haskellPackages.gi-gtk
    pkgs.haskellPackages.gi-vte
    pkgs.haskellPackages.gi-glib
    pkgs.haskellPackages.haskell-gi-base
    pkgs.haskellPackages.glib

    pkgs.pkg-config
    pkgs.glib

  ];

  shellHook = ''
    echo "Welcome to the Nixxy development environment!"
  '';
}

