# WebDAV mount for copyparty using rclone (faster than davfs2)
# https://copyparty.guilherme.zip/?hc
# Toggle with webdav-copyparty.nix by commenting one or another in system/default.nix
{ lib, config, pkgs, ... }:
let
  password = lib.strings.trim (builtins.readFile /etc/nixos/user/g_password);
  mountPoint = "/mnt/copyparty";

  # Generate rclone-obscured password at build time
  # rclone config files require passwords to be obscured (encrypted + base64)
  obscuredPassword = lib.strings.trim (builtins.readFile (pkgs.runCommand "rclone-obscure-pass"
    {
      nativeBuildInputs = [ pkgs.rclone ];
    }
    ''
      rclone obscure '${password}' > $out
    ''));
in
{
  config = {
    environment.systemPackages = with pkgs; [ rclone ];

    # Create mount point directory
    systemd.tmpfiles.rules = [
      "d ${mountPoint} 0755 g fuse -"
    ];

    # Write rclone config with WebDAV backend (password obscured at build time)
    environment.etc."rclone-copyparty.conf".text = ''
      [copyparty]
      type = webdav
      url = https://copyparty.guilherme.zip
      vendor = owncloud
      pacer_min_sleep = 0.01ms
      user = g
      pass = ${obscuredPassword}
    '';
    environment.etc."rclone-copyparty.conf".mode = "0600";

    # Systemd service to mount WebDAV via rclone
    systemd.services."mnt-copyparty" = {
      description = "WebDAV mount for copyparty (rclone)";
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      before = [ "remote-fs.target" ];
      wantedBy = [ "remote-fs.target" "multi-user.target" ];

      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.rclone}/bin/rclone mount copyparty: ${mountPoint} --config /etc/rclone-copyparty.conf --vfs-cache-mode writes --dir-cache-time 5s --allow-other";
        ExecStop = "/run/current-system/sw/bin/fusermount -u ${mountPoint}";
        KillMode = "process";
        Restart = "on-failure";
        RestartSec = "60";
        TimeoutStartSec = "30";
        TimeoutStopSec = "30";
      };
    };
  };
}