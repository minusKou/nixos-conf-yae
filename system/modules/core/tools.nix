{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    android-tools
     btop
     curl
     eza
     fastfetch
     fish
     fzf
     neovim
     pciutils
     sbctl
     scrcpy
     starship
     tree
     unzip
     wget
  ];
}
