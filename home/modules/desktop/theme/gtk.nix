{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme.name = "adw-gtk3-dark";
    iconTheme.name = "Papirus-Dark";
    # cursorTheme.name = "Bibata-Modern-Classic"; // NOTE: Already declared on home/niri/niri/env.kdl
    font = {
      name = "Readex Pro";
      size = 11;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "adw-gtk3-dark";
      icon-theme = "Papirus-Dark";
      font-name = "Readex Pro 11";
      document-font-name = "Readex Pro 11";
      monospace-font-name = "JetBrains Mono 11";
    };
  };

  home.packages = with pkgs; [
    adw-gtk3
    nwg-look
  ];
}
