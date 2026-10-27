{pkgs, ... }:

{
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.flatpak.enable = true;
# services.openssh.enable = true;

  services.udev.packages = [
  (pkgs.writeTextFile {
    name = "mouse-hidraw-udev-rules";
    destination = "/etc/udev/rules.d/70-mouse-hidraw.rules";
    text = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="373b", ATTRS{idProduct}=="1085", TAG+="uaccess"
    '';
  })
];
}
