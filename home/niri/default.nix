{ ... }:
{
  xdg.configFile = {
    "niri/config.kdl".source = ./config.kdl;
    "niri/niri".source = ./niri;
    "niri/custom".source = ./custom;
    "niri/bg.png".source = ./bg.png;
  };
}
