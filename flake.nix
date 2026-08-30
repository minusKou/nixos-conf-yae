{
  description = "A very basic flake";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs.nixpkgs.follows = "nixpkgs";
      #home-manager.follows = "home-manager";
    };
    
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
  };

  outputs = { self, nixpkgs, home-manager, lanzaboote, nix-cachyos-kernel, ... }@inputs:
  let
    username = "alhanz";
  in {
    nixosConfigurations.yae = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs username; };

      modules = [{
        nixpkgs.overlays = [
          nix-cachyos-kernel.overlays.pinned
        ];
      }

       	./configuration.nix
        
       	# Read HW Configuration instead of Local
       	/etc/nixos/hardware-configuration.nix
                
       	# Home Manager
	      home-manager.nixosModules.home-manager

				# Lanzaboote
        lanzaboote.nixosModules.lanzaboote
      ];
    };
  };
}
