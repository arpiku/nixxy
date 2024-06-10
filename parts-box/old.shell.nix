{ pkgs ? import <nixpkgs> {} }:

# TODO: Create a flake to lock down code version


pkgs.mkShell {
  buildInputs = [
    #pkgs.vim # TODO: For developing a very minimal workstation setup in future by just using nixxy
  
    #For Haskell
    pkgs.ghc
    pkgs.cabal-install

    # # This is for building st (suckless terminal)
    # pkgs.xorg.libX11
    # pkgs.xorg.libXft
    # pkgs.pkg-config

    # #This is to build tmux
    # pkgs.automake
    # pkgs.autoconf
    # pkgs.libevent
    # pkgs.pkg-config
    # pkgs.byacc
    # pkgs.ncurses

    #I don't know what I am doing anymore tbh : <
    #Pkgs for terminator
    # pkgs.vte
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
    pkgs.haskellPackages.haskell-gi-base
    pkgs.pkg-config

  ];

  shellHook = ''
    echo "Welcome to the Nixxy development environment!"
  '';
}

