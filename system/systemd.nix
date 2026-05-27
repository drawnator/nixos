# _xfce.nix
{ lib, config, pkgs, ... }:
{
 config = {
    systemd.tmpfiles.rules = [
      "e /home/g/Downloads 0755 g g - 7d"
    ];
 };
}

