{ username, ... }:
{
  programs.noctalia = {
    enable = true;

    settings = {
      theme = {
        mode = "dark";
       	source = "builtin";
       	builtin = "Rosé Pine";

       	templates = {
          enable_builtin_templates = true;
       	  enable_community_templates = true;

       	  builtin_ids = [
            "btop"
            "gtk3"
            "gtk4"
            "kitty"
            "kcolorscheme"
            "niri"
            "starship"
            "qt"
       	  ];

          community_ids = [
            "discord"
            "fastfetch"
            "neovim"
            "zed"
          ];
       	};
      };

      shell = {
        font_family = "Space Grotesk";
      };

      bar.default = {
        font_family = "Space Grotesk";
      };

      wallpaper = {
        enable = true;
        fill_mode = "crop";
        directory = "/home/${username}/.config/niri";
      };
    };
  };

  # CRUCIAL: create a noctalia file or else everything breaks!
  systemd.user.tmpfiles.rules = [
    "f %h/.config/niri/noctalia.kdl 0644 - - - -"
  ];
}
