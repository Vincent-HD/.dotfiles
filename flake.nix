{

	description = "Vincent's flake!";

	inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
		nixos-wsl.url = "github:nix-community/nixos-wsl";
	};

	outputs = { self, nixpkgs, nixos-wsl, ...}:
	let
		lib = nixpkgs.lib;
	in {
		nixosConfigurations = {
			nixos = lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./configuration.nix
					nixos-wsl.nixosModules.wsl
				];
			};
		};
	};

}
