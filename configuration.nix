{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix];

  
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  networking.hostName = "damon"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  boot.extraModulePackages = [ config.boot.kernelPackages.rtl8821cu ];
  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";
    i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # nablCUPS to print documents.
  services.printing.enable = true;

  #NIX settings
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.arpiku = {
    isNormalUser = true;
    description = "Arpit";
    extraGroups = [ "networkmanager" "wheel" "audio" "video"];
    shell = pkgs.fish;
    packages = with pkgs; [
      firefox
      kate
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
	fonts.packages = with pkgs; [
 	  noto-fonts
	  noto-fonts-cjk
	  noto-fonts-emoji
	  liberation_ttf
	  fira-code
	  fira-code-symbols
	  mplus-outline-fonts.githubRelease
	  dina-font
	  proggyfonts
    nerdfonts
	];

  environment.variables.EDITOR = "hx";
  environment.variables.SUDO_EDITOR = "vim";

  programs.nix-ld.enable = true;

  programs.fish.enable=true;
  

  environment.systemPackages = with pkgs; [
      zellij

      alacritty
      tmux
    #fish
    fish

#For Haskell setup
    ghc 
    cabal-install

    gopls
    golint
    nodejs_22



    kakoune
    kakoune-lsp

    #golang
    go
    golint
   
    freecad

    python3

    pavucontrol #For maanging sound
  
    xclip
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    wirelesstools
    networkmanager
    vivaldi 
    terminator
    
    #Fonts
    nerdfonts

   
    helix
    yazi
    obs-studio
    git
    gh
    vscode
    coreutils
    glow
    marktext

    #
    taskwarrior
    busybox
    
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   shell = pkgs.fish
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
