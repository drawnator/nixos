# template.nix
{ lib, config, pkgs, ... }:
{
  imports = [
  ./xfce.nix
  # ./dracula.nix # error: 'dracula-theme' has been removed because it depended on 'gtk-engine-murrine', which was removed because it was unmaintained upstream and depended on GTK 2
  ./adwaita.nix
 ];
}

