{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "rust"
      "catppuccin-icons"
    ];
    userSettings = {
      theme = "Noctalia Dark";
      icon_theme = "Catppuccin Mocha";

      # Autosave
      autosave = {
        after_delay = {
          milliseconds = 2000;
        };
      };

      # Font configurations (optional)
      ui_font_family = "Readex Pro";
      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_font_size = 14;

      # Optional editor features
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      vim_mode = false;
    };
  };

  # NixOS related fixes
  home.packages = with pkgs; [
    nixd
    nil
  ];
}
