{ config, pkgs, ... }:
let
  qtConfig = ''
[Appearance]
color_scheme_path=${config.home.homeDirectory}/.config/qt6ct/style-colors.conf
custom_palette=true
standard_dialogs=default
style=Breeze

[Fonts]
fixed="Readex Pro,11,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular,0,0"
general="Readex Pro,11,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular,0,0"

[Interface]
activate_item_on_single_click=1
buttonbox_layout=2
cursor_flash_time=1000
dialog_buttons_have_icons=1
double_click_interval=400
gui_effects=@Invalid()
keyboard_scheme=3
menus_have_icons=true
show_shortcuts_in_context_menus=true
stylesheets=@Invalid()
toolbutton_style=4
underline_shortcut=1
wheel_scroll_lines=3

[Troubleshooting]
force_raster_widgets=1
ignored_applications=@Invalid()
  '';
in
{
  # QT Theming
  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };
  
  # Environment Variables
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland;xcb";
  };

  # Symlink qt6ct
  xdg.configFile."qt6ct/qt6ct.conf".text = qtConfig;

  home.packages = with pkgs; [
    bibata-cursors
    kdePackages.breeze
    kdePackages.kcolorscheme
    kdePackages.kconfig
    kdePackages.kiconthemes
    papirus-icon-theme
    qt6Packages.qt6ct
  ];
}
