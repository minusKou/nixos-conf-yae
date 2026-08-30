{ pkgs, ... }:

let
  custom-fonts = pkgs.stdenvNoCC.mkDerivation {
    pname = "custom-fonts";
    version = "1.0";

    srcs = [
      ./google-fonts.tar.gz
      ./windows-core.tar.gz
      ./windows-cjk-1.tar.gz
      ./windows-cjk-2.tar.gz
    ];

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/fonts/truetype

      find . -type f \( -name "*.ttf" -o -name "*.ttc" \) -exec install -Dm644 -t $out/share/fonts/truetype {} +
      runHook postInstall
    '';
  };
in
{
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        sansSerif = [ "Readex Pro" "DejaVu Sans" ];
	monospace = [ "JetBrains Mono" "JetBrainsMono Nerd Font" ];
      };
    };
  };

  home.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    custom-fonts
  ];
}
