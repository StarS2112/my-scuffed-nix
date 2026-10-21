{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    umbriel.url = "github:noctalia-dev/umbriel";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/02b8219a7dc6dd9db5660718382555ef25fce02c";
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
       ({ pkgs, ... }: {
        nixpkgs.overlays = [ inputs.nix-cachyos-kernel.overlays.pinned ];
        boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
      })
    ];
   };
  };
}
