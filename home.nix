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
cursorTheme = pkgs.stdenvNoCC.mkDerivation {
		pname = "Braun_Cursor";
		version = "1.0";

		src = ./nixos/GoodFriendCursor;

		installPhase = ''
				mkdir -p $out/share/icons/Braun_Cursor
				cp -r ./* $out/share/icons/Braun_Cursor/
				'';
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
	theme = {
		name = "Arc-Darker";
		package = pkgs.arc-theme;
	};
	cursorTheme = {
		name = "Braun_Cursor";
		package = cursorTheme;
	};
	font = {
		package = pkgs.nerd-fonts.jetbrains-mono;
		name = "JetBrainsMono Nerd Font";
		size = 13;
		};

#	iconTheme = {
#		name = "Catpuccin ";
#		package = pkgs.catppuccin-papirus-folders;
#	};
#	colorScheme = "light";

};

home.pointerCursor = {
		name = "Braun_Cursor";
		package = cursorTheme; 
		size = 26;
		gtk.enable = true;
		hyprcursor.enable = true;
    };

programs.git = {
    	enable = true;
	settings = {
      		user = {
        	name  = "VinAreXav";
        	email = "ruiruikurushi@gmail.com";
      		};
		credential.helper = "${
          		pkgs.git.override { withLibsecret = true; }
        		}/bin/git-credential-libsecret";

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

