{ config, pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./copyparty.nix
    # ./webdav-copyparty.nix # davfs2 - requires root, slower, needs davfs2 group
    ./rclone-copyparty.nix    # rclone - faster, no root needed, recommended
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
    ./gestures.nix
  ];
}