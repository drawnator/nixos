{ lib, config, pkgs, ... }:
{
  # REQUIRED: Enable the Nix compatibility loader for dynamically linked executables
  imports = [
      (fetchTarball "https://github.com/nix-community/nixos-vscode-server/tarball/master")
  ];

  config = {
      environment.systemPackages = with pkgs; [ vscodium ];
      services.vscode-server.enable = true;
      environment.pathsToLink = ["/bin"];
      environment.shells = [pkgs.bash];
      system.activationScripts.binbash = ''
          mkdir -p /usr/bin
          ln -sf ${pkgs.bash}/bin/bash /usr/bin/bash
      '';
  };
}