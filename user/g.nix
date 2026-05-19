# _xfce.nix
{ lib, config, pkgs, ... }:
{
 imports =
 [
 ../software/vscodium.nix
 ];
 config = {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.groups.g = {}; 
  users.users.g = {
    isNormalUser = true;
     description = "guilherme";
     group = "g";
     extraGroups = [ "networkmanager" "wheel" ];
     packages = with pkgs; [
     #thunderbird
     unzip
    openvpn
   ];
  };
 };
}
