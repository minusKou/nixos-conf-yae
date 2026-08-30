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

      # Use Alejandra as the Nix formatter
      languages = {
        Nix = {
          formatter = {
            external = {
              command = "alejandra";
              arguments = [ "--quiet" "-" ];
            };
          };
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
    alejandra # .nix formatter
    nixd
    nil
  ];
}
