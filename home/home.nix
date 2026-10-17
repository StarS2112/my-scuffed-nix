{ config, pkgs, ...}: {
  home.stateVersion = "26.05";
  home.packages = [ pkgs.htop ];
  programs.git = {
    enable = true;
    userName  = "StarS2112";
    userEmail = "nxagamersb@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      # optional nice defaults
      pull.rebase = true;
      core.editor = "kate";   # or whatever you use
    };
  };   
  xdg.configFile."fastfetch".source = ./config/fastfetch;
  xdg.configFile."kitty".source = ./config/kitty;
  xdg.configFile."noctalia".source = ./config/noctalia;
  xdg.configFile."umbriel".source = ./config/umbriel;
}
