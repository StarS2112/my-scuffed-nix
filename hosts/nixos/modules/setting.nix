{ config, pkgs, ... }:

{
  nix.gc = {
    automatic = true;
    dates = "weekly"; # or any schedule you prefer
    options = "--max-old-generations 2"; # Keep 2 old + 1 current = 3 total
  };

  nix.settings.trusted-users = [ "root" "stars" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings = {
    extra-substituters = [
      "https://noctalia.cachix.org"
      "https://nix-gaming.cachix.org"
      "https://cache.xinux.uz"
    ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
     ];
  };

  security.polkit.enable = true;
  networking.networkmanager.enable = true;
  networking.hostName = "nixos";

  xdg.mime.defaultApplications = {
  "inode/directory" = "org.kde.dolphin.desktop";
  };

  systemd.tmpfiles.rules = [
    "d /etc/brave/policies/managed 0755 stars users -"
    "f+ /home/stars/.config/mimeapps.list 0644 stars users - [Default Applications]\\ninode/directory=org.kde.dolphin.desktop\\napplication/x-zerosize=org.kde.kate.desktop\\nx-scheme-handler/discord=vesktop.desktop\\nx-scheme-handler/discord-1216669957799018608=discord-1216669957799018608.desktop\\n"
  ];
}
