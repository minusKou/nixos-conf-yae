{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;

      extraCompatPackages = with pkgs; [
        proton-ge-custom
        proton-cachyos_x86_64_v3
      ];
    };
  };
}
