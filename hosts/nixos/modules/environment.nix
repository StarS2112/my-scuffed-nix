{config, pkgs, ... }:

{

  environment.etc."xdg/menus/applications.menu".source =
    "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  #use Wayland for electron/chromium stuff
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables. QT_QPA_PLATFORMTHEME = "kde";

  environment.shellAliases = {
    f = "fastfetch";
    ff = "fetch";
    rebuild-force =  "sudo nixos-rebuild switch --flake ~/nixos-config/#nixos";
    rebuild-etc = "sudo nixos-rebuild switch";
    rebuild = "git -C ~/nixos-config add . && sudo nixos-rebuild switch --flake ~/nixos-config/#nixos";
    update = "nix flake update --flake ~/nixos-config";
    edit-conf = "kate ~/nixos-config/hosts/nixos/configuration.nix";
    edit-flake = "kate ~/nixos-config/flake.nix";
    edit-home = "kate ~/nixos-config/home/home.nix";
    push-conf = "git -C ~/nixos-config add . && echo 'Enter commit message:' && read msg && git -C ~/nixos-config commit -m \"$msg\" && git -C ~/nixos-config push origin master";
    pull-conf = "git -C ~/nixos-config pull origin master";
  };
}
