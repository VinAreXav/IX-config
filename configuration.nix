{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [ "uinput" ];
  
  networking = {
  	hostName = "absurd";
  	networkmanager.enable = true;
  	firewall = {
  		enable = true;
	};
  };

  time.timeZone = "Asia/Bishkek";

  i18n = {
		defaultLocale = "en_US.UTF-8";
		inputMethod = {
				enable = true;
				type = "fcitx5";
		fcitx5 = {
      		waylandFrontend = true;
      		ignoreUserConfig = false;
			addons = with pkgs; [
        		fcitx5-mozc-ut
				fcitx5-hangul	
				];
		};
};
	
   };
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  hardware = {
 	keyboard.qmk.enable = true;
  	opentabletdriver.enable = true;
	uinput.enable = true;	
	graphics.enable = true;
	bluetooth.enable = true;	  
  	nvidia = {
		package = config.boot.kernelPackages.nvidiaPackages.stable;
		open = false;         
    		nvidiaSettings = true;
		prime = {
			offload.enable = true;
			intelBusId = "PCI:0:2:0";   
			nvidiaBusId = "PCI:1:0:0";
		};
    	};
  };
  services = {
  	input-remapper.enable = true;
  	udisks2.enable = true;
	printing.enable = true;
	libinput.enable = true;
	blueman.enable = true;
  	upower.enable = true;
  	openssh.enable = true;
  	asusd.enable = true;
  	flatpak.enable = true;
	displayManager.sddm = {
		enable = true;	
		wayland.enable = true;
		theme = "sddm-astronaut-theme";
		extraPackages = [ pkgs.sddm-astronaut ];
	};
	xserver = {
  		enable = true;
		autoRepeatDelay = 200;
		autoRepeatInterval = 35;

		videoDrivers = [ "nvidia" ];
	};
	pipewire = {
		enable = true;
     		pulse.enable = true;
   	};
  };

  users.users.xavier = {
     isNormalUser = true;
     extraGroups = [ "wheel" "input" ]; 
     packages = with pkgs; [
       tree
     ];
     shell = pkgs.zsh;
  };


  environment.localBinInPath = true;
  environment.sessionVariables = {
  XCURSOR_THEME = "Braun_Cursor";
  XCURSOR_SIZE = "26";
};
  environment.systemPackages = with pkgs; [
  input-remapper
	wget
	swaybg
	awww
	nemo
	wl-clipboard
	wayland-utils
	eww
	fzf
	nwg-look
	bc
	gh
	krita-unwrapped
	mpv
	ruff
	yt-dlp
	blender
	anki-bin
	ankiAddons.anki-connect
	ankiAddons.review-heatmap
	file-roller
	p7zip
	unzip
	gnutar
	fastfetch
	psmisc
	python315
	glib
	kdePackages.polkit-kde-agent-1
	pavucontrol
	inkscape
	libreoffice
	wine64Packages.stagingFull
	(bottles.override { removeWarningPopup = true; })
	winetricks
	brightnessctl
	ayugram-desktop
	file
	freetube
	dex
	heroic
	protonplus
	protontricks
	gcc
	scriptisto
	lazygit
	cargo
	clippy
	peaclock
	sunsetr
	zathura
	qutebrowser
	lua5_4_compat
	htop
	obs-studio
#pureref
	jq
	chameleos
	pciutils
	libnotify
	figma-linux
	nix-prefetch
	nsxiv
	openutau
	librewolf-bin
	wpgtk
	clickgen
	xcursorgen
	gst_all_1.gstreamer
	gst_all_1.gst-plugins-bad
	gst_all_1.gst-plugins-good
	inputs.ani2xcursor.packages.${pkgs.system}.default
	win2xcur
];
  fonts = {
    fontconfig.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
		hachimarupop
		nanum
		udev-gothic-nf
		nerd-fonts.jetbrains-mono
	];
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  
  xdg.portal = {
		enable = true;
		configPackages = [ pkgs.hyprland ];	
		extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
#		extraPortals = [ inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland ];
  };

  programs = {
	gnupg.agent = {
     		enable = true;
     		enableSSHSupport = true;
  		};
	hyprland = {
		enable = true;
		withUWSM = true;
		xwayland.enable = true;
#		package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
#		portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
	};
    niri = {
			enable = true;
	};	
	zsh.enable = true;
	rog-control-center.enable = true;
	steam.enable = true;
	mtr.enable = true;
	nix-ld = {
			enable = true;
			libraries = with pkgs; [
				libxcb-cursor
				libxcursor
			];
	};
	dconf.enable = true;
  	#firefox.enable = true;
  };
   #virtualisation.virtualbox.host.enable = true;
   #users.extraGroups.vboxusers.members = [ "xavier" ];
   #virtualisation.virtualbox.host.enableExtensionPack = true;
   #virtualisation.virtualbox.guest.enable = true;
   #virtualisation.virtualbox.guest.dragAndDrop = true;

  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;
  nix = {
		settings = {
#substituters = ["https://hyprland.cachix.org"];
#trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
				max-jobs = 8;
		};
  };
  system.stateVersion = "26.05"; 
}

