# _xfce.nix
{ lib, config, pkgs, ... }:
{
 config = {
  environment.systemPackages = with pkgs; [lshw];
 };
}

