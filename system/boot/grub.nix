# grub boot; enables chosing nixos version when booting
# https://nixos.wiki/wiki/Bootloader
{ lib, config, pkgs, ... }:
{
 config = {
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
#   boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #sudo nixos-rebuild switch --install-bootloader
 };
}

