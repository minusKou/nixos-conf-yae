{ pkgs, ... }:
{
  programs = {
    niri.enable = true;
    xwayland.enable = true;
  };

  # Application Services
  services = {
    upower.enable = true;

    # Display Manager
    greetd = {
      enable = true;
      settings = {
        # Autologin on system boot
        initial_session = {
          command = "niri-session";
          user = "alhanz";
        };

        # Fallback / Logout screen using tuigreet
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-user-session --asterisks --cmd niri-session";
          user = "greeter";
        };
      };
    };
  };
}
