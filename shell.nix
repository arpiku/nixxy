{ pkgs ? import <nixpkgs> {} }:

# TODO: Create a flake to lock down code version


pkgs.mkShell {
  buildInputs = [
    pkgs.ghc
    pkgs.cabal-install
    pkgs.pkg-config
    pkgs.zlib

    #For Building Kakoune
    pkgs.gnumake

    #For Arnold
    pkgs.vte
    pkgs.gtk3
    pkgs.keybinder3
    pkgs.libnotify
    pkgs.python311Packages.pycairo
    pkgs.python311Packages.pygobject3
    pkgs.python311Packages.configobj
    pkgs.python311Packages.psutil
    pkgs.gsettings-desktop-schemas
    pkgs.pkg-config

    
    #Dbus for terminator control
    pkgs.python311Packages.dbus-python

    pkgs.pydeps


  ];

  shellHook = ''
    echo "Welcome to the Nixxy development environment!"
    export XDG_DATA_DIRS=${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}:$XDG_DATA_DIRS

    
  '';
}

