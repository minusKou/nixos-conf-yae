{ pkgs, ... }:
{

  # Niri
  xdg.configFile = {
    "niri/config.kdl".source = ./config.kdl;
    "niri/niri".source = ./niri;
    "niri/custom".source = ./custom;
    "niri/bg.png".source = ./bg.png;
  };



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
