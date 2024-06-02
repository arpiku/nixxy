{ pkgs ? import <nixpkgs> {}} :
  pkgs.mkShell {
    buildInputs = with pkgs;[
      ghc
      cabal-install

      #TODO: seperate differenct functionalities in different shells
      helix

    ];
}
