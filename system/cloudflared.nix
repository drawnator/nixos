# template.nix
{ lib, config, pkgs, ... }:
{
 config = {
    environment.systemPackages = [
      pkgs.cloudflared
    ];
 };
}

