{ config, pkgs, ... }:

let 

nonFreePackages = [
    pkgs.google-chrome
];

essentialPackages = [
    pkgs.firefox
    pkgs.git
    pkgs.home-manager
    pkgs.gnome.gnome-terminal
    pkgs.gnome.gnome-tweaks
];

systemPackages = [
    pkgs.vim 
    pkgs.wget
    pkgs.htop
    pkgs.curl

    pkgs.vscode
];

in
{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  services.flatpak.enable = true;
  virtualisation.docker.enable = true;
  
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;

  networking.hostName = "dn-jetbook"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  i18n = {
      inputMethod = {
        enabled = "ibus";
        ibus.engines = with pkgs.ibus-engines; [ mozc ];
      };
    };

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
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.davidnuon = {
    isNormalUser = true;
    description = "David Nuon";
    extraGroups = [ "networkmanager" "wheel" "docker" "vboxusers" ];
    packages = with pkgs; (
	essentialPackages ++ nonFreePackages
    );
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = systemPackages;

  system.stateVersion = "22.05"; # Don't change this
}
