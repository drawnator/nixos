{ config, pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./localization.nix
    ./network.nix
    # ./nvidia.nix #running graphics on gpu is making notebook extremly hot
    ./sound.nix
    ./xfce
  ];
}