{
  inputs = {
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };
  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        base16-ef-themes = pkgs.stdenv.mkDerivation {
          name = "base-16-ef-themes";
          src = ./.;
          postInstall = ''
            mkdir $out
            cp *.yaml $out
          '';
        };
      }
    );
}
