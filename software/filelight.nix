# template.nix
{ lib, config, pkgs, ... }:
{
 home-manager.users.g = { pkgs, ... }: {
  home.packages = with pkgs; [
      kdePackages.filelight
    ];
  xdg.configFile."Thunar/uca.xml" = {
    force = true;
    text = ''
<?xml version="1.0" encoding="UTF-8"?>
<actions>
<action>
  <icon>utilities-terminal</icon>
  <name>Open Terminal Here</name>
  <submenu></submenu>
  <unique-id>1778851484020258-1</unique-id>
  <command>exo-open --working-directory %f --launch TerminalEmulator</command>
  <description>Example for a custom action</description>
  <range></range>
  <patterns>*</patterns>
  <startup-notify/>
  <directories/>
</action>
<action>
  <icon>filelight</icon>
  <name>Open in Filelight</name>
  <submenu></submenu>
  <unique-id>filelight-dir-usage</unique-id>
  <command>filelight %f</command>
  <description>View disk usage of this directory with Filelight</description>
  <range></range>
  <patterns>*</patterns>
  <startup-notify/>
  <directories/>
</action>
</actions>
    '';
  };
 };
}

