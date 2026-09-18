# template.nix
{ lib, config, pkgs, ... }:
{
 imports = [
  
 ];
 config = {
  services.xserver.wacom.enable = true;
  # Enable OpenTabletDriver
  hardware.opentabletdriver.enable = true;

  # Required by OpenTabletDriver
  hardware.uinput.enable = true;
  boot.kernelModules = [ "uinput" ];
  environment.systemPackages = [
    pkgs.libwacom
    pkgs.xf86-input-wacom
  ];
 };
}

