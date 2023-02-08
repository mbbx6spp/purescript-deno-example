{
  description = "Flake for purescript-deno-example";

  nixConfig.bash-prompt = "\[purescript-deno-example\]> ";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-22.11";
    flake-utils.url = "github:numtide/flake-utils";
    flake-utils.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
        inherit (pkgs) mkShell;
      in
      {
        overlay = final: prev: {
        };

        devShell = import ./shell.nix { inherit pkgs; };
      }
    );

}
