{ pkgs, ... }:

let
  custom-fonts = pkgs.stdenvNoCC.mkDerivation {
    pname = "custom-local-fonts";
    version = "1.0";

    src = ./fonts;

    installPhase = "
      runHook preInstall
      mkdir -p $out/share/fonts/truetype

      cp -R . $out/share/fonts/truetype
      runHook postInstall
    ";
  };
in
{
  fonts.fontDir.enable = true;

  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono

    custom-fonts
  ];
}
