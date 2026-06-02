# template.nix
{ lib, config, pkgs, ... }:
{
 imports = [
  
 ];
 config = {
    environment.systemPackages = with pkgs;[
      (let
        zen-flake = import (builtins.fetchTarball "https://github.com/youwen5/zen-browser-flake/archive/master.tar.gz") { inherit pkgs; };
      in zen-flake.default)
      (makeDesktopItem {
        name = "zen";
        desktopName = "Zen";
        genericName = "Zen browser";
        exec = "zen"; # Change to your actual CLI command
        icon = "zen-browser";                     # Icon displayed in application finder
        # terminal = true;                                 # Set to true if it needs a visible terminal window
        categories = [ "Network" ];
      })
    ];
 };
}

