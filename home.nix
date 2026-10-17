{ pkgs, ...}: {
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
}
