{ config, pkgs, inputs, ... }:
{
  imports = [
    ./system/modules
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

  # System-wide Font Directory
  fonts.fontDir.enable = true;

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
     starship
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

  # System-level Packages
  programs = {
    niri.enable = true;
    xwayland.enable = true;
  };

  # Application Services
  services = {
    cloudflare-warp.enable = true;
    upower.enable = true;

    # Display Manager
    greetd = {
      enable = true;
      settings = {
        # Autologin
        initial_session = {
          command = "niri-session";
          user = "alhanz";
        };

      # Fallback Session
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --cmd niri-session";
	  user = "greeter";
        };
      };
    };
  };

  system.stateVersion = "26.11";
}
