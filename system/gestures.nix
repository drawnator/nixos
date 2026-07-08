# template.nix
{ lib, config, pkgs, ... }:
{
 imports = [
  
 ];
 config = {
  # services..enable = true;
  # services.xserver.libinputlibinput.enable = true;
  environment.systemPackages = with pkgs; [ 
    # libinput-gestures
  ]; 
 };
}

