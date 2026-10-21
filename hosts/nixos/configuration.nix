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
  
  programs.fish.enable = true;


   programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi #optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
    ];
  };

  programs.gpu-screen-recorder = {
    enable = true;
    ui.enable = true; # For overlay
  };

  programs.appimage = {
  enable = true;
  binfmt = true;
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ icu openssl zlib ];

  services.udisks2.enable = true;
  services.gvfs.enable = true;   
  services.flatpak.enable = true;

  #drivers
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.uinput.enable = true;

  #opentabletdriver stuff
  boot.kernelModules = [ "uinput" ];
  hardware.opentabletdriver.enable = true;
  hardware.opentabletdriver.daemon.enable = true;
  hardware.opentabletdriver.blacklistedKernelModules = [
    "hid_uclogic"
    "wacom"
  ];

  environment.etc."xdg/menus/applications.menu".source =
    "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  #use Wayland for electron/chromium stuff
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables. QT_QPA_PLATFORMTHEME = "kde";

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #support for other filesystem
  boot.supportedFilesystems = [ "ntfs" "exfat"];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

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

  # Define a user account. Don't forget to set a password with ‘passwd’.
#   users.users."stars" = {
#     isNormalUser = true;
#     description = "stars-nix";
#     extraGroups = [ "networkmanager" "wheel" ];
#     packages = with pkgs; [];
#     shell = pkgs.fish;
#   };


  #fonts
#   fonts.packages = with pkgs; [
#     noto-fonts
#     noto-fonts-cjk-sans
#     noto-fonts-color-emoji
#     maple-mono.NF-unhinted
#     maple-mono.CN-unhinted
#     maple-mono.truetype
#     inter
#   ];

  security.polkit.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

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


  environment.shellAliases = {
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

  systemd.tmpfiles.rules = [
    "d /etc/brave/policies/managed 0755 stars users -"
  ];
}
