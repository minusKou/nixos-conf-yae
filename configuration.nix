{ inputs, ... }:
{
  imports = [
    ./system/modules
  ];

  # System-wide Font Directory
  fonts.fontDir.enable = true;

  time.timeZone = "Asia/Manila";

  # Home Manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";

    extraSpecialArgs = { inherit inputs; };
    users.alhanz = import ./home/home.nix;
  };

  system.stateVersion = "26.11";
}
