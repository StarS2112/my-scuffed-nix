{ config, pkgs, ...}: {
  home.stateVersion = "26.05";
  home.packages = [ pkgs.htop ];
  programs.git = {
  enable = true;
  settings = {
    user = {
      name = "StarS2112";
      email = "nxagamersb@gmail.com";
    };
    init = {
      defaultBranch = "main";
    };
    pull = {
      rebase = true;
    };
    core = {
      editor = "kate";
    };
  };
};
  programs.fish.enable = true;
  xdg.configFile."fish".source = ./config/fish;
  xdg.configFile."fastfetch".source = ./config/fastfetch;
  xdg.configFile."kitty".source = ./config/kitty;
  xdg.configFile."noctalia".source = ./config/noctalia;
  xdg.configFile."umbriel".source = ./config/umbriel;
}
