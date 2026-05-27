# template.nix
{ lib, config, pkgs, ... }:
{
 home-manager.users.g = { pkgs, ... }: {
  home.packages = with pkgs; [
      dracula-theme # Dracula GTK/GNOME theme
    ];

    # Enable GTK and set the Dracula theme
    gtk = {
      enable = true;
      theme = {
        name = "Dracula";
        package = pkgs.dracula-theme;
      };
      iconTheme = {
        name = "Dracula";
        package = pkgs.dracula-icon-theme;
      };
      gtk4.theme = null;
    };
    #Set GTK4 (libadwaita) dark mode and theme preferences
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "Dracula";
      };
    };
 };
}

