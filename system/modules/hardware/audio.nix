{ ... }:
{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # Native Wayland Apps
    extraConfig.pipewire."92-low-latency" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
       	"default.clock.quantum" = 64;
       	"default.clock.min-quantum" = 32;
       	"default.clock.max-quantum" = 1024;
      };
    };

    # For WINE Applications
    extraConfig.pipewire-pulse."92-low-latency" = {
      "pulse.properties" = {
        "pulse.min.req" = "32/48000";
       	"pulse.min.frag" = "32/48000";
       	"pulse.min.quantum" = "32/48000";
      };
    };
  };

  # Use Realtime Scheduler for Performance
  security.rtkit.enable = true;
}
