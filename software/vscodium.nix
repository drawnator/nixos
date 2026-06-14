{ lib, config, pkgs, ... }:
{
  # REQUIRED: Enable the Nix compatibility loader for dynamically linked executables
  imports = [
      (fetchTarball "https://github.com/nix-community/nixos-vscode-server/tarball/master")
  ];

  config = {
      environment.systemPackages = with pkgs; [ vscodium ];
      services.vscode-server.enable = true;
  };
}