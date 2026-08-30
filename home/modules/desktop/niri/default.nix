{ pkgs, ... }:
{
  # Niri
  xdg.configFile = {
    "niri/config.kdl".source = ./config.kdl;
    "niri/niri".source = ./niri;
    "niri/bg.png".source = ./bg.png;
  };

  # User-level Niri configuration
  systemd.user.tmpfiles.rules = [
    "d %h/.config/niri/custom 0755 - - - -"
    "f %h/.config/niri/custom/env.kdl 0644 - - - -"
    "f %h/.config/niri/custom/general.kdl 0644 - - - -"
    "f %h/.config/niri/custom/keybinds.kdl 0644 - - - -"
    "f %h/.config/niri/custom/rules.kdl 0644 - - - -"
    "f %h/.config/niri/custom/startup.kdl 0644 - - - -"
  ];

  home.packages = with pkgs; [
    # Dolphin File Manager
    kdePackages.dolphin
    kdePackages.kio
    kdePackages.kio-extras
    kdePackages.ffmpegthumbs
    kdePackages.kimageformats

    kitty
    xwayland-satellite
  ];
}
