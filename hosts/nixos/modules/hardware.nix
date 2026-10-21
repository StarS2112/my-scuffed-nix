{config, pkgs, ... }:
{
  #drivers
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  hardware.uinput.enable = true;

  #opentabletdriver stuff
  boot.kernelModules = [ "uinput" ];
  hardware.opentabletdriver.enable = true;
  hardware.opentabletdriver.daemon.enable = true;
  hardware.opentabletdriver.blacklistedKernelModules = [
    "hid_uclogic"
    "wacom"
  ];
}
