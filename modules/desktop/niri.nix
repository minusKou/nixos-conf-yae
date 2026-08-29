{ pkgs, ... }:
{
  # Niri
  programs = {
    niri.enable = true;
    xwayland.enable = true;
  };

  # Display Manager
  services.greetd = {
    enable = true;
    settings = {
      # Autologin
      initial_session = {
        command = "niri-session";
	user = "alhanz";
      };

      # Fallback Session
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --cmd niri-session";
	user = "greeter";
      };
    };
  };

  environment.systemPackages = with pkgs; [    
    # Dolphin File Manager
    kdePackages.dolphin
    kdePackages.kio
    kdePackages.kio-extras
    kdePackages.ffmpegthumbs
    kdePackages.kimageformats

    kitty
    xwayland-satellite
  ];
}
