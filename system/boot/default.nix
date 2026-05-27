# linux desktop environment configurations
{ config, pkgs, ... }:

{
  imports = [
    ./grub.nix
  ];
}