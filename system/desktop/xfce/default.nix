# template.nix
{ lib, config, pkgs, ... }:
{
  imports = [
  ./xfce.nix
  ./dracula.nix
  # ./adwaita.nix
 ];
}

