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
        "https://nyx-cache.chaotic.cx"
        "https://noctalia.cachix.org"                 # noctalia-shell
        "https://nix-cache.tokidoki.dev/tokidoki"     # nix-gaming-edge for proton-cachy
      ];
      trusted-public-keys = [
        "nyx-cache.chaotic.cx:dJxTrgMC3V3cFfyIiBQDQorG6k1LsqurH/srpMSq7qk="
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4"
        "tokidoki:MD4VWt3kK8Fmz3jkiGoNRJIW31/QAm7l1Dcgz2Xa4hk="
      ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
