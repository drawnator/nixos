# template.nix
{ lib, config, pkgs, ... }:
{
 imports = [
  
 ];
 config = {
    environment.systemPackages = [
      pkgs.kdePackages.filelight
    ];
 };
}

