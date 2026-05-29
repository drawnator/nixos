# template.nix
{ lib, config, pkgs, ... }:
{
 config = {
  ## home manager configs
  home-manager.users.g = { pkgs, ... }: {

    xfconf.settings = {
      xsettings = {
        "Net/ThemeName" = "Adwaita"; # GTK Theme
        "Net/IconThemeName" = "Papirus"; # Icon Theme
        "Gtk/FontName" = "Ubuntu 11"; # System Font
        "Gtk/CursorThemeName" = "Adwaita"; # Cursor
      };
      xfwm4 = {
        "general/theme" = "Adwaita"; # Window Manager Border
      };
    };
    programs.vscode.profiles.default = {
      userSettings = {
        "workbench.colorTheme" = "Light+";
      };
    };
  };
 };
}

