{ config, pkgs, ... }: {
  imports = [
    ./bootloader.nix
    ./audio.nix
    ./package.nix
    ./program.nix
    ./noctalia.nix
    ./service.nix
    ./hardware.nix
    ./locale.nix
    ./setting.nix
    ./font.nix
    ./user.nix
    ./environment.nix
  ];
}
