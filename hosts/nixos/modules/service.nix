{pkgs, ... }:

{
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.flatpak.enable = true;
# services.openssh.enable = true;

}
