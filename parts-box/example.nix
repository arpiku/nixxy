# example.nix
with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "update-submodules";
  src = null; # No source files needed for this script
  buildInputs = [ git ];

  phases = [ "installPhase" ];

  installPhase = ''
    #!/bin/bash

    # Function to update submodules and commit changes
    update_submodule() {
      local submodule_path=$1
      local commit_message=$2

      # Navigate to the submodule
      cd $submodule_path || { echo "Submodule path '$submodule_path' does not exist."; exit 1; }

      # Commit and push changes in the submodule
      git add .
      git commit -m "$commit_message"
      git push origin master

      # Go back to the main repository
      cd - > /dev/null || { echo "Failed to return to the main repository."; exit 1; }

      # Update the submodule reference in the main repository
      git add $submodule_path
      main_commit_message="Update submodule $submodule_path: $commit_message"
      git commit -m "$main_commit_message"
    }

    # Check if the number of arguments is even (each submodule path should have a corresponding commit message)
    if [ $(( $# % 2 )) -ne 0 ]; then
      echo "Usage: $0 <submodule_path1> <commit_message1> <submodule_path2> <commit_message2> ..."
      exit 1
    fi

    # Iterate through the arguments two at a time
    while [ $# -gt 0 ]; do
      update_submodule $1 $2
      shift 2
    done

    # Push changes to the main repository's remote
    git push origin master
  '';

  # Set the script as executable
  postInstall = "chmod +x $out/bin/update-submodules";
}

