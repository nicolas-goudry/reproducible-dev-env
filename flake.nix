{
  description = "Reproducible development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
        "aarch64-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems f;
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          gen = pkgs.writeShellApplication {
            name = "gen";
            runtimeInputs = [
              pkgs.marp-cli
            ];
            text = "marp slides";
          };

          watch = pkgs.writeShellApplication {
            name = "watch";
            runtimeInputs = [
              pkgs.marp-cli
            ];
            text = "marp slides -w";
          };
        });
    };
}
