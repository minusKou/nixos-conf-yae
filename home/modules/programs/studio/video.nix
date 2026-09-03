{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ffmpeg
    shotcut
    vlc
  ];

  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio.override {
      cudaSupport = true;
    };
    plugins = with pkgs.obs-studio-plugins; [
      advanced-scene-switcher
      obs-pipewire-audio-capture
      obs-vkcapture
      obs-teleport
      distroav
    ];
  };
}
