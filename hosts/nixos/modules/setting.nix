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
}
