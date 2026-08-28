{ ... }:
{
  home = {
    homeDirectory = "/home/alhanz";
    stateVersion = "26.11";
  };

  imports = [
    ./niri
    ./noctalia
  ];

  programs.home-manager.enable = true;
}
