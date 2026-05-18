# _docker.nix
{ lib, config, pkgs, ... }:
{
 config = {
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      experimental = true;
      default-address-pools = [
       {
         base = "172.30.0.0/16";
         size = 24;
       }
      ];
    };
  };
  
  users.users.g.extraGroups = ["docker"];
  #environment.systemPackages = [
  #  pkgs.docker
  #  pkgs.docker-client
  #];
  };
}

