# _xfce.nix
{ lib, config, pkgs, ... }:
{

 config = {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.g = {
    isNormalUser = true;
     description = "guilherme";
     extraGroups = [ "networkmanager" "wheel" ];
     packages = with pkgs; [
     #thunderbird
     unzip
    #  vscodium
   ];
  };
 };
}
