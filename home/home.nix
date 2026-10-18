{ config, pkgs, ... }: {
  home.stateVersion = "26.05";
  home.packages = [
    pkgs.htop
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "StarS2112";
        email = "nxagamersb@gmail.com";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "kate";
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = false;
  };

  # Direct out-of-store symlinks for instant dotfile editing without rebuilding
  xdg.configFile."fish".source = config.lib.file.mkOutOfStoreSymlink "/home/stars/nixos-config/home/config/fish";
  xdg.configFile."fastfetch".source = config.lib.file.mkOutOfStoreSymlink "/home/stars/nixos-config/home/config/fastfetch";
  xdg.configFile."kitty".source = config.lib.file.mkOutOfStoreSymlink "/home/stars/nixos-config/home/config/kitty";
  xdg.configFile."noctalia".source = config.lib.file.mkOutOfStoreSymlink "/home/stars/nixos-config/home/config/noctalia";
  xdg.configFile."obs-studio".source = config.lib.file.mkOutOfStoreSymlink "/home/stars/nixos-config/home/config/obs-studio";
  xdg.configFile."umbriel".source = config.lib.file.mkOutOfStoreSymlink "/home/stars/nixos-config/home/config/umbriel";
  xdg.configFile."starship.toml".source = config.lib.file.mkOutOfStoreSymlink "/home/stars/nixos-config/home/config/starship/starship.toml";
}
