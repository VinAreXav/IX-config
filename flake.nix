{
	description = "Trying again again again";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		aagl = {
			url = "github:ezKEa/aagl-gtk-on-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
#		quickshell = {
#			url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
#			inputs.nixpkgs.follows = "nixpkgs";
#		};
	};

	outputs = { self, nixpkgs, home-manager, aagl,  ... }@inputs:
		let
		username = "mumu";
		system = "x86_64-linux";
		lib = nixpkgs.lib;
		in
	{
		nixosConfigurations.nagasono = nixpkgs.lib.nixosSystem {
			inherit system;
			specialArgs = {
				host = "nagasono";
				inherit self inputs username;
			};
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.mumu = import ./home.nix;
						backupFileExtension = "backup";
					};
				}
				{
					imports = [ aagl.nixosModules.default ];
					nix.settings = aagl.nixConfig;
					programs.anime-game-launcher.enable = true;
					programs.sleepy-launcher.enable = true;
					programs.honkers-railway-launcher.enable = true;
				}
			];
		};

	
	};
	
}
