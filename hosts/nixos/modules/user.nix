{pkgs, ... }:

{
  users.users."stars" = {
    isNormalUser = true;
    description = "stars-nix";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };
}
