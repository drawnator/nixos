# https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265
{ lib, config, pkgs, ... }:
{
 config = {
  # Install the required Hunspell dictionary (e.g., Portuguese)
  environment.systemPackages = with pkgs; [
    hunspellDicts.pt_BR
  ];
  # Force Firefox to use system dictionaries and set your default language code
  programs.firefox = {
    enable = true;
    policies = {
      Preferences = {
        "intl.spellcheck.dicts" = "pt-BR";
      };
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value= true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
      DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
      SearchBar = "unified"; # alternative: "separate"
      Homepage.StartPage = "previous-session";
    };
  };
 };
}

