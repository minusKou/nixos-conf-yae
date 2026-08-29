{ pkgs, ... }:
{
  imports = [
    ./dolphin.nix
    ./gtk.nix
    ./qt.nix
  ];
}
