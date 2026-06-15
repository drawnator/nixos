# template.nix
{ lib, config, pkgs, ... }:
{
 config = {
    services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ "g" ];
      MaxAuthTries = 20;
      # PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
    };
  };
 };
}

