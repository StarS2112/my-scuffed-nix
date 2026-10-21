{ inputs, pkgs, ... }:

{

  # Allow unfree packages
   nixpkgs.config.allowUnfree = true;

# List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
   environment.systemPackages = with pkgs; [
    (python3.withPackages (ps: [ ps.pillow ]))
    btop
    fuse
    git
    vim
    fastfetch
    wget
    ntfs3g
    exfatprogs
    steam
    steam-run
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    kitty
    brave
    vesktop
    spicetify-cli
    kdePackages.partitionmanager
    kdePackages.dolphin
    kdePackages.kate
    kdePackages.ktexteditor
    kdePackages.kio
    kdePackages.kio-extras
    kdePackages.kio-fuse
    kdePackages.kio-admin
    kdePackages.ark
    kdePackages.ffmpegthumbs
    kdePackages.qt6ct
    kdePackages.plasma-integration
    dconf
    bibata-cursors-translucent
    bibata-cursors
    android-tools
    scrcpy
    gvfs
    pciutils
    ffmpeg-full
    v4l-utils
    starship
    eza
    mpv
    imv
    qpwgraph
    xdg-desktop-portal-gtk
    xdg-desktop-portal
    wl-clipboard
    grim
    swappy
    slurp
    fuzzel
    unzip
    xwayland-satellite
   ];
}
