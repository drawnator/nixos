# _xfce.nix
{ lib, config, pkgs, ... }:
{
 config = {
    #https://man7.org/linux/man-pages/man5/tmpfiles.d.5.html
    systemd.tmpfiles.rules = [
      "e /home/g/Downloads - - - 7d"
    ];
 };
}

