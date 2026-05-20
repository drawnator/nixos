{ config, pkgs, ... }:

{
  imports = [
    # ./docker.nix
    ./firefox.nix
    ./git.nix
    ./vscodium.nix
  ];
}