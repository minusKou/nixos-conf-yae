{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
     btop
     curl
     eza
     fastfetch
     fish
     fzf
     git
     neovim
     pciutils
     starship
     tree
     wget
  ];
}