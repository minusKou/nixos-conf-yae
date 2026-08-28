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
  ];

  programs.home-manager.enable = true;
}
