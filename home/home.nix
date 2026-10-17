{ config, pkgs, ... }: {
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

  # Enable the shell and the theme engine natively here
  programs.fish.enable = true;
  programs.starship.enable = true;

  # Shortcut link rules pointing to repository configs folder
  xdg.configFile."fish".source = ./config/fish;
  xdg.configFile."fastfetch".source = ./config/fastfetch;
  xdg.configFile."kitty".source = ./config/kitty;
  xdg.configFile."noctalia".source = ./config/noctalia;
  xdg.configFile."umbriel".source = ./config/umbriel;

  # Links starship configuration directly where the prompt engine reads it
  xdg.configFile."starship.toml".source = ./config/starship/starship.toml;
}
