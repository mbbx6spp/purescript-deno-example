{ pkgs ? import <nixpkgs> {}}:
let
  inherit (pkgs) mkShell;
in mkShell {
  # all the command-line tools a developer might need to work in the codebase
  buildInputs = with pkgs; [
    deno
    purescript
    spago
  ];
}
