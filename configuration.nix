# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/desktop/niri.nix
    ./modules/hardware/audio.nix
  ];

  # Bootloader
  boot = {
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-bore-lto-x86_64-v4;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "yae";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Manila";

  # User account
  users.users."alhanz" = {
    isNormalUser = true;
    description = "alhanz";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Allow Experimental Features
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    
    # Binary Cache
    substituters = [
      "https://attic.xuyh0120.win/lantian" # nix-cachyos-kernel
      "https://noctalia.cachix.org" # noctalia-shell
    ];
    trusted-public-keys = [
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4"
    ];
  };

  # System-level Packages
  environment.systemPackages = with pkgs; [
     btop
     cloudflare-warp
     curl
     eza
     fastfetch
     fish
     fzf
     git
     neovim
     pciutils
     wget
  ];

  # Home Manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";

    extraSpecialArgs = { inherit inputs; };
    users.alhanz = import ./home/home.nix;
  };

  # Application Services
  services = {
    cloudflare-warp.enable = true;
  };

  system.stateVersion = "26.11";
}
