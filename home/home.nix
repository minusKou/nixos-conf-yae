{ ... }:
{
  home = {
    homeDirectory = "/home/alhanz";
    stateVersion = "26.11";
  };

  imports = [
    ./fish
    ./kitty
    ./niri
    ./noctalia
    ./starship
    ./theme
  ];

  programs.home-manager.enable = true;
}
