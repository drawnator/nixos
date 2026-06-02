# template.nix
{ lib, config, pkgs, ... }:
{
 imports = [
  
 ];
 config = {
    environment.systemPackages = [
    (import (builtins.fetchTarball "https://github.com/youwen5/zen-browser-flake/archive/master.tar.gz") {
      inherit pkgs;
    })
  ];
 };
}

