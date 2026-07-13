{config, pkgs, ... }:
let 
 dotfiles = "${config.home.homeDirectory}/IX-config/config";
 create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
 configs = {
		 nvim = "nvim";
		 nsxiv = "nsxiv";
		 qutebrowser = "qutebrowser";
		 kitty = "kitty";
		 matugen = "matugen";
		 niri = "niri";
		 quickshell = "quickshell";
		 rofi = "rofi";
		 OpenTabletDriver = "OpenTabletDriver";
		 hypr = "hypr";
		 fastfetch = "fastfetch";
		 rog = "rog";
		 sunsetr = "sunsetr";
		 fcitx5 = "fcitx5";
		 swaync = "swaync";
 };

 in

{
	home.username = "xavier";
	home.homeDirectory = "/home/xavier";
	home.stateVersion = "26.05";
	programs.zsh = {
		enable = true;
		shellAliases = {
			btw = "echo struggling btw";
			la = "ls -a";
		};
	};
	programs.zoxide = {
  		enable = true;
  		enableZshIntegration = true;
  		options = [ "--cmd cd" ];
	};
  xdg.configFile = builtins.mapAttrs 
		(name: subpath: {
		source = create_symlink "${dotfiles}/${subpath}";
		recursive = true;
 }) configs;


 gtk = {
	enable = true;
	cursorTheme.package = pkgs.catppuccin-cursors.latteDark;
	cursorTheme.name = "Catpuccin Latte Dark Cursor";
	theme.name = "Plata-Lumine-Compact";
	theme.package = pkgs.plata-theme;
#	iconTheme.name = "Catpuccin ";
#	iconTheme.package = pkgs.catppuccin-papirus-folders;
#	colorScheme = "light";
	font = {
		package = pkgs.nerd-fonts.jetbrains-mono;
		name = "JetBrainsMono Nerd Font";
		size = 13;
		};
};

programs.git = {
    	enable = true;
	settings = {
      		user = {
        	name  = "VinAreXav";
        	email = "ruiruikurushi@gmail.com";
		credential.helper = "${
          		pkgs.git.override { withLibsecret = true; }
        		}/bin/git-credential-libsecret";
      		};
	init.defaultBranch = "main";
	};
};	

programs.vesktop.enable = true;

  home.packages = with pkgs; [
	ripgrep
	nil
	nixpkgs-fmt
	nodejs
	gcc
	obsidian
	neovim
	kitty 
	rofi
	git
  ];

}
