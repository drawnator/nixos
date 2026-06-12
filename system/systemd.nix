#https://man7.org/linux/man-pages/man5/tmpfiles.d.5.html
{ lib, config, pkgs, ... }:
{
 config = {
    systemd.tmpfiles.rules = [
      "e /home/g/Downloads - - - 1d"
    ];
 };
}

