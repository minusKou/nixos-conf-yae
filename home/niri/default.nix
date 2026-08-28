{ pkgs, config, ... }:
{
  xdg.configFile = {
    "niri/config.kdl".source = ./config.kdl;
    "niri/niri".source = ./niri;
  }
}
