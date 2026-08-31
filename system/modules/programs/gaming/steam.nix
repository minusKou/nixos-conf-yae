{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;

      extraCompatPackages = with pkgs; [
        proton-ge-bin
        proton-cachyos-x86_64-v3
      ];
  };
}
