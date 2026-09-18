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
		matugen = {
			url = "github:/InioX/Matugen";
		};
#		quickshell = {
#			url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
#			inputs.nixpkgs.follows = "nixpkgs";
#		};
		hyprland = {
				url = "github:hyprwm/Hyprland";
				inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, aagl, matugen, hyprland, ... }@inputs:
		let
		username = "xavier";
		system = "x86_64-linux";
		lib = nixpkgs.lib;
		in
	{
		nixosConfigurations.absurd = nixpkgs.lib.nixosSystem {
			inherit system;
			specialArgs = {
				host = "absurd";
				inherit self inputs username;
			};
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.xavier = import ./home.nix;
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
				{
					environment.systemPackages = [
					matugen.packages.${system}.default
					];
				}
			];
		};

	
	};
	
}
