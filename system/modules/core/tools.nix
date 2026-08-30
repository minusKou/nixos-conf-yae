{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
     btop
     curl
     eza
     fastfetch
     fish
     fzf
     neovim
     pciutils
     starship
     tree
     wget
  ];
}
