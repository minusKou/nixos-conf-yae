{ lib, ... }:
{
  boot.loader = {
    systemd-boot.enable = lib.mkForce false;
    efi.canTouchEfiVariables = true;
  };

  boot.lanzaboote = {
    enable = true;
    autoGenerateKeys.enable = true;
    autoEnrollKeys = {
      enable = true;
      autoReboot = true;
    };
    pkiBundle = "/var/lib/sbctl";
    configurationLimit = 15;
  };
}
