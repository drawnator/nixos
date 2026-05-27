# template.nix
{ lib, config, pkgs, ... }:
{
 config = {
  ## home manager configs
  home-manager.users.g = { pkgs, ... }: {
    xfconf.settings = {
      xsettings = {
        "Net/ThemeName" = "Adwaita-dark"; # GTK Theme
        "Net/IconThemeName" = "Papirus-Dark"; # Icon Theme
        "Gtk/FontName" = "Ubuntu 11"; # System Font
        "Gtk/CursorThemeName" = "Adwaita"; # Cursor
      };
      xfwm4 = {
        "general/theme" = "Adwaita-dark"; # Window Manager Border
      };
    };
  };
 };
}

