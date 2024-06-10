{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
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
  ];

  shellHook = ''
    echo "Welcome to the Nixxy development environment!"


    #Figuring this one out caused me a lot of pain, a looot of pain!
    export XDG_DATA_DIRS=${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}:$XDG_DATA_DIRS

   # export XDG_DATA_DIRS=${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas
    ##:${pkgs.gtk3}/share:${pkgs.glib}/share:$XDG_DATA_DIRS
    #glib-compile-schemas ${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas

  '';
}


