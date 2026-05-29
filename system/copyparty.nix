# https://github.com/9001/copyparty#nixos-module
{ lib, config, pkgs, ... }:
let 
  copyparty = fetchTarball "https://github.com/9001/copyparty/archive/hovudstraum.tar.gz";
in 
{
 imports = [ "${copyparty}/contrib/nixos/modules/copyparty.nix" ];
 config = {
  environment.systemPackages = [ pkgs.copyparty ];
  networking.firewall.allowedTCPPorts = [ 3923 3921];
  networking.firewall.allowedUDPPorts = [ 3923 3921];
  #sudo journalctl -a -f -u copyparty
  services.copyparty = {
    enable = true;
    # Global settings (maps to the [global] section of copyparty config)
    settings = {
      i = "0.0.0.0";
      p = 3923; 
      ftp = 3921;
    };
    accounts.g.passwordFile = "/etc/nixos/user/g_password";
    volumes = {
      "/" = {
        path = "/mnt/data";
        access = {
          r = "*";
          rw = [ "g" ];
        };
      };
    };
  };
 };
}

