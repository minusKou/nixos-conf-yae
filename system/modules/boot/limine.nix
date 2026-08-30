{ lib, ... }:
{
  boot.loader = {
    # Force disable systemd-boot
    systemd-boot.enable = lib.mkForce false;

    # Enable limine
    limine.enable = true;
    efi.canTouchEfiVariables = true;
  };

  catppuccin = {
    enable = true;
    autoEnable = false;
  };

  catppuccin.limine = {
    enable = true;
    flavor = "mocha";
  };
}
