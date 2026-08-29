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
    ./modules/programs/browser/zen
    ./starship
    ./theme
  ];

  programs.home-manager.enable = true;
}
