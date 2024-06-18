{
  description = "Zev basic flake";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";
    nixpkgs.url = "nixpkgs/nixos-24.05";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      sylpha = lib.nixosSystem {
        specialArgs = { inherit inputs; };
        inherit system;
        modules = [
          ./hosts/sylpha/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      zev = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./hosts/home.nix
        ];
      };
    };
  };
}
