{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
  };

  outputs = { self, nixpkgs, nix-cachyos-kernel, ... }@inputs: {
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
      ];
    };
  };
}
