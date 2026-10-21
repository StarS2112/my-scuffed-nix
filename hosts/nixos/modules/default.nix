{ config, pkgs, ... }: {
  imports = [
    ./package.nix
    ./audio.nix
    ./noctalia.nix
    ./service.nix
    ./setting.nix
    ./font.nix
    ./user.nix
  ];
}
