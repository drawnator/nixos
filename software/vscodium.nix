{ lib, config, pkgs, ... }:
{
 config = {
     environment.systemPackages = with pkgs; [ vscodium ];
     # REQUIRED: Enable the Nix compatibility loader for dynamically linked executables
     programs.nix-ld.enable = true;

 };
}