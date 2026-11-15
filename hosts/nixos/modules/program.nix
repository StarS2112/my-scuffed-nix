{pkgs, inputs,  ... }:

{
  #fish
  programs.fish.enable = true;

  #obs-studio
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi #optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
      obs-aitum-multistream
    ];
  };

  #appimage-run
 programs.appimage = {
  enable = true;
  binfmt = true;
  package = pkgs.appimage-run.override {
    extraPkgs = pkgs: with pkgs; [
      icu
      stdenv.cc.cc.lib   # ← this provides libstdc++.so.6 (fixes your error)
      # add more later if needed, e.g.:
      zstd
      libGL
      xorg.libxcb
    ];
  };
};



  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraEnv = {
        LD_AUDIT = "${
          inputs.sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.sls-steam
        }/library-inject.so:${
          inputs.sls-steam.packages.${pkgs.stdenv.hostPlatform.system}.sls-steam
        }/SLSsteam.so";
      };
    };
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ icu openssl zlib ];
}
