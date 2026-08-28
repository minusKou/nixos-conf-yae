{ ... }:
{
  home = {
    homeDirectory = "/home/alhanz";
    stateVersion = "26.11";
  };

  imports = [
    ./niri
  ];

  programs.home-manager.enable = true;
}
