# linux desktop environment configurations
{ config, pkgs, ... }:

{
  imports = [
    ./systemd-boot.nix
  ];
}