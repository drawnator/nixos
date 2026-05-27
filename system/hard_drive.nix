# hard-drive utils lists disks and partitions
{ lib, config, pkgs, ... }:
{
 config = {
  environment.systemPackages = with pkgs; [lshw];
 };
}

