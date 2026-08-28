{ ... }:
{
  environment.systemPackages = with pkgs; [
    adw-gtk-theme
    bibata-cursors
    nwg-look
    qt6Packages.qt6ct
  ];
}
