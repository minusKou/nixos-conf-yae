{ ... }:
{
  # Drive Tweaks
  fileSystems."/".options = [
    "noatime"
    "compress=zstd:3"
    "space_cache=v2"
    "ssd"
    "discard=async"
  ];

  services = {
    # Force 'none' scheduler for NVMe drives
    udev.extraRules = ''
      ACTION=="add|change", KERNEL=="nvme[0-9]*", ATTR{queue/scheduler}="none"
    '';

    # Drive maintenance
    btrfs.autoScrub = {
      enable = true;
      interval = "monthly";
      fileSystems = [ "/" ];
    };
    fstrim = {
      enable = true;
      interval = "weekly";
    };
  };
}
