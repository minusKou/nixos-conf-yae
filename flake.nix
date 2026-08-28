{
  description = "A very basic flake";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
  };

  outputs = { self, nixpkgs, home-manager, nix-cachyos-kernel, ... }@inputs: {
    nixosConfigurations.yae = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      
      modules = [
        {
	  nixpkgs.overlays = [
            nix-cachyos-kernel.overlays.pinned
	  ];
	}

	./configuration.nix
	
	# Read HW Configuration instead of Local
	/etc/nixos/hardware-configuration.nix

	# Home Manager
	home-manager.nixosModules.home-manager
      ];
    };
  };
}
