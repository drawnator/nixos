{ config, pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./copyparty.nix
    ./cloudflared.nix
    ./hard_drive.nix
    ./localization.nix
    ./direnv.nix
    ./fish.nix
    ./network.nix
    # ./nvidia.nix #running graphics on gpu is making notebook extremly hot
    ./sound.nix
    ./ssh.nix
    ./systemd.nix
    ./desktop
    ./boot
  ];
}