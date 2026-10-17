{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixcord.url = "github:4evy/nixcord";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    umbriel.url = "github:noctalia-dev/umbriel";
    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
      #inputs.nixpkgs.follows = "nixpkgs"; #disable caches
     };
   };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
   nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
     system = "x86_64-linux";
     specialArgs = { inherit inputs; };
     modules = [
       ./hosts/nixos/configuration.nix
      home-manager.nixosModules.home-manager
      {
       home-manager.useGlobalPkgs = true;
       home-manager.useUserPackages = true;
       home-manager.extraSpecialArgs = { inherit inputs; };
       home-manager.users.stars = import ./home/home.nix;
      }
    ];
   };
  };
}
