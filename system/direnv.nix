# https://wiki.nixos.org/wiki/Direnv
{ lib, config, pkgs, ... }:
{
 config = {
  programs.direnv.enable = true;
  #use "direnv allow ."
 };
}

