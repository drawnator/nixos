# _xfce.nix
{ lib, config, pkgs, ... }:
{
 config = {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.groups.g = {}; 
  users.users.g = {
    isNormalUser = true;
     description = "guilherme";
     group = "g";
      extraGroups = [ "networkmanager" "wheel" "copyparty" "fuse" "davfs2"];
     packages = with pkgs; [
     #thunderbird
     unzip
     fastfetch
     fd
     blender
     discord
     krita
     nmap
     rsync
   ];
  };
 };
}
