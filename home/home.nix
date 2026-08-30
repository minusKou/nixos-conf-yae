{ username, ... }:
{
  home = {
    homeDirectory = "/home/${username}";
    stateVersion = "26.11";
  };

  imports = [
    ./modules
  ];

  programs.home-manager.enable = true;
}
