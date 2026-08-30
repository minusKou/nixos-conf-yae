{
  imports = [
    ./warp-cli.nix
  ];

  networking = {
    hostName = "yae";
    networkmanager.enable = true;
  };
}
