{ ... }:
{


  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
    };

    # Nix store
    optimise = {
      automatic = true;
      dates = [ "12:00" ];
    };

    settings = {
      auto-optimise-store = true;
      download-attempts = 3;
      warn-dirty = false;
      min-free = 10000000000;
      min-free-check-interval = 30;
      # Allow Experimental Features
      experimental-features = [ "nix-command" "flakes" ];

      # Binary Cache
      substituters = [
        "https://cache.nixos.org"
        "https://attic.xuyh0120.win/lantian" # nix-cachyos-kernel
        "https://noctalia.cachix.org" # noctalia-shell
      ];
      trusted-public-keys = [
        "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4"
      ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
