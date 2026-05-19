{ config, pkgs, ... }:

{
  imports = [
    # ./bluetooth.nix
    ./localization.nix
    ./network.nix
    ./nvidia.nix
    ./sound.nix
    ./xfce.nix
  ];
}