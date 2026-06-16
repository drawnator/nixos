{ lib, config, pkgs, ... }:
{
  # REQUIRED: Enable the Nix compatibility loader for dynamically linked executables
  imports = [
      (fetchTarball "https://github.com/nix-community/nixos-vscode-server/tarball/master")
  ];

  config = {
      environment.systemPackages = with pkgs; [ vscodium ];
      services.vscode-server = {
        enable = true;
        installPath = ["$HOME/.kiro-server"];
      };
      environment.shells = [pkgs.bash];

      # envfs provides /usr/bin and /bin as a FUSE filesystem. The Kiro/VS Code
      # remote-ssh install script runs with a hardcoded, circular PATH:
      #   env -i PATH=/usr/bin:/bin bash --noprofile --norc -c '<script>'
      # Since the caller PATH only points at the envfs mounts themselves, envfs
      # can only resolve binaries from its fallback-path. Populate that fallback
      # with the tools the install script needs (uname, grep, sed, tar, gzip,
      # curl/wget, which, ps, and the rest of coreutils).
      services.envfs.enable = true;
      services.envfs.extraFallbackPathCommands = ''
        for pkg in \
          ${pkgs.coreutils} \
          ${pkgs.gnugrep} \
          ${pkgs.gnused} \
          ${pkgs.gnutar} \
          ${pkgs.gzip} \
          ${pkgs.procps} \
          ${pkgs.which} \
          ${pkgs.curl} \
          ${pkgs.wget} \
          ${pkgs.bash}; do
          for bin in "$pkg"/bin/*; do
            ln -sf "$bin" "$out/$(basename "$bin")"
          done
        done
      '';
  };
}
