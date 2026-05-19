# _xfce.nix
{ lib, config, pkgs, ... }:
{
 config = {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  services.blueman.enable = true;
 };
}

