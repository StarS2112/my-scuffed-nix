# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, inputs, ... }:
 {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/default.nix
     ];
  
#   programs.fish.enable = true;
#
#
#    programs.obs-studio = {
#     enable = true;
#
#     plugins = with pkgs.obs-studio-plugins; [
#       wlrobs
#       obs-backgroundremoval
#       obs-pipewire-audio-capture
#       obs-vaapi #optional AMD hardware acceleration
#       obs-gstreamer
#       obs-vkcapture
#     ];
#   };
#
#   programs.gpu-screen-recorder = {
#     enable = true;
#     ui.enable = true; # For overlay
#   };
#
#   programs.appimage = {
#   enable = true;
#   binfmt = true;
#   };

#   programs.nix-ld.enable = true;
#   programs.nix-ld.libraries = with pkgs; [ icu openssl zlib ];

#   #drivers
#   hardware.graphics.enable = true;
#   hardware.graphics.enable32Bit = true;
#   hardware.uinput.enable = true;
#
#   #opentabletdriver stuff
#   boot.kernelModules = [ "uinput" ];
#   hardware.opentabletdriver.enable = true;
#   hardware.opentabletdriver.daemon.enable = true;
#   hardware.opentabletdriver.blacklistedKernelModules = [
#     "hid_uclogic"
#     "wacom"
#   ];

  # Set your time zone.
  time.timeZone = "Asia/Kuching";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}
