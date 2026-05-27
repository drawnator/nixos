# if you like something other than the sound of the fan
{ lib, config, pkgs, ... }:
{
 config = {
  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is e>
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };  
 };
}

