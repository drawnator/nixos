# WebDAV mount for copyparty server
# https://blog.tiserbox.com/posts/2024-02-23-mounting-webdav-folder-in-nix-os.html
{ lib, config, pkgs, ... }:
let
  webdavUrl = "https://copyparty.guilherme.zip";
  mountPoint = "/mnt/copyparty";
  password = lib.strings.trim (builtins.readFile /etc/nixos/user/g_password);
in
{
  config = {
    # davfs2 needs a dedicated user/group
    users.groups.davfs2 = {};
    users.users.davfs2 = {
      isSystemUser = true;
      group = "davfs2";
      description = "davfs2 WebDAV user";
    };

    environment.systemPackages = with pkgs; [ davfs2 ];

    # Create mount point directory
    systemd.tmpfiles.rules = [
      "d ${mountPoint} 0755 g davfs2 -"
    ];

    # Configure davfs2
    environment.etc."davfs2/davfs2.conf".text = ''
      # Global settings
      cache_size 16
      dir_refresh 60
      use_proxy 0
      # Disable lock files for copyparty compatibility (copyparty doesn't support WebDAV locks)
      use_locks 0
      # Increase timeouts for slower connections
      connect_timeout 30
      read_timeout 30
    '';

    # WebDAV credentials - uses same password as copyparty
    environment.etc."davfs2/secrets".text = ''
      ${webdavUrl} g ${password}
    '';
    environment.etc."davfs2/secrets".mode = "0600";

    # Systemd service to mount WebDAV via davfs2
    systemd.services."mnt-copyparty" = {
      description = "WebDAV mount for copyparty";
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      before = [ "remote-fs.target" ];
      wantedBy = [ "remote-fs.target" "multi-user.target" ];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = "${pkgs.davfs2}/bin/mount.davfs ${webdavUrl} ${mountPoint}";
        ExecStop = "${pkgs.davfs2}/bin/umount.davfs ${mountPoint}";
        TimeoutStartSec = "30";
        TimeoutStopSec = "30";
      };
    };
  };
}