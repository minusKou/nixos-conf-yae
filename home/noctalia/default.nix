{ pkgs }:
{
  programs.noctalia = {
    enable = true;

    settings = {
      theme = {
        mode = "dark";
	source = "builtin";
	builtin = "Catppucccin";
      };
    };

    # Enables NetworkManager, Bluetooth, and UPower
    recommendedServices.enable = true;
    # Enable modules to run on systemd
    systemd.enable = true;
  };
}
