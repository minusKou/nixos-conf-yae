{ pkgs, ... }:

let
  custom-fonts = pkgs.stdenvNoCC.mkDerivation {
    pname = "custom-local-fonts";
    version = "1.0";

    src = ./custom-ttfs;

    installPhase = "
      runHook preInstall
      mkdir -p $out/share/fonts/truetype

      cp -R . $out/share/fonts/truetype
      runHook postInstall
    ";
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
