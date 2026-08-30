{ lib, ... }:
{
  boot.loader = {
    systemd-boot.enable = lib.mkForce false;
    efi.canTouchEfiVariables = true;
  };

  boot.kernelParams = [
    # Graphic Driver Tweaks
    "i915.enable_guc=3"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
  ];

  boot.kernel.sysctl = {
    # Network Socket Buffer Size Tweaks
    "net.core.rmem_default" = 262144;
    "net.core.wmem_default" = 262144;
    "net.core.rmem_max" = 7500000;
    "net.core.wmem_max" = 7500000;
    "net.ipv4.udp_rmem_min" = 16384;
    "net.ipv4.udp_wmem_min" = 16384;

    # inotify watch limits
    "fs.inotify.max_user_watches" = 524288;
    "fs.inotify.max_user_instances" = 8192;
    "vm.vfs_cache_pressure" = 50;
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
