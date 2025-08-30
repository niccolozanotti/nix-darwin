{
  description = "@niccolozanotti's nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    modules = import ./modules;
  in {
    darwinConfigurations."macbook-pro14" = nix-darwin.lib.darwinSystem {
      modules = [
        modules.system
        modules.packages
        modules.homebrew
        modules.fonts
        modules.shells
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "niccolozanotti";
            autoMigrate = true;
          };
          # Set Git commit hash for darwin-version
          system.configurationRevision = self.rev or self.dirtyRev or null;
        }
      ];
    };
  };
}
