{ config, pkgs, ... }:

{
  imports = [
    # ./docker.nix
    ./filelight.nix
    ./firefox.nix
    ./git.nix
    ./vscodium.nix
  ];
}