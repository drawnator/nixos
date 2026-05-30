# template.nix
{ lib, config, pkgs, ... }:
{
 imports = [
  
 ];
 config = {
  
 };
 home-manager.users.g = { pkgs, ... }: {
  home.packages = with pkgs; [
    ];
 };
}

