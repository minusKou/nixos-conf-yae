{
  imports = [
    ./kernel.nix
    ./specialisation.nix
    ./tools.nix
    ./tweaks.nix
  ];

  services.udisks2.enable = true;
}
