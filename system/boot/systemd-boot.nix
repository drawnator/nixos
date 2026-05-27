# systemd boot
{ lib, config, pkgs, ... }:
{
 config = {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #sudo nixos-rebuild switch --install-bootloader
 };
}

