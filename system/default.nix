{ config, pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./localization.nix
    ./direnv.nix
    ./network.nix
    # ./nvidia.nix #running graphics on gpu is making notebook extremly hot
    ./sound.nix
    ./xfce
  ];
}