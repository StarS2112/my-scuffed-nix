{ config, pkgs, inputs, ... }:

{
  imports =
    [
      inputs.noctalia.nixosModules.default
      inputs.umbriel.nixosModules.default
     ];

  programs.umbriel.enable = true;
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
   };
  programs.noctalia.systemd.enable = true;
  services.displayManager.noctalia-greeter = {
    enable = true;
    settings = {
      cursor.size = 24;
      keyboard.layout = "us";
     };
    cursorTheme = {
     package = pkgs.bibata-cursors;
     name = "Bibata-Modern-Ice";
     };
   };

  xdg.portal = {
  enable = true;
  extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  config.common.default = [ "umbriel" "gtk" ];
  };

# Plugins programs

# Gpu Sceeen Recorder
  programs.gpu-screen-recorder = {
    enable = true;
    ui.enable = true; # For overlay
  };

}
