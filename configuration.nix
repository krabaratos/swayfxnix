{ config, pkgs, ... }:

{
  imports =
    [
     ./hardware-configuration.nix
     ./gaming.nix
     ./sway.nix
     ./amd.nix
    ];

 #Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; #Flakes
  nixpkgs.config.allowUnfree = true; #unfree
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use Xanmod kernel.
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;

  # Enable networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

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

  #Service X11
  services.xserver.enable = true; #X11
   services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  #Flatpak
  services.flatpak.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;


   # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
};

  
  #User Settings
  users.users.manish = {
    isNormalUser = true;
    description = "Manish Meena";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      
    ];
  };

  #System Level packages
  environment.systemPackages = with pkgs; [
    android-tools
    appimage-run
    bottles
    brave
    bzip2
    discord
    fastfetch
    flatpak-xdg-utils
    git
    glfw
    gnutar
    gvfs
    gzip
    htop
    jdk21
    krita
    libxkbcommon
    mpv
    obs-studio
    onlyoffice-desktopeditors
    obsidian
    p7zip
    prismlauncher
    qbittorrent
    scrcpy
    unrar
    unzip
    vscode
    xkeyboard_config
    xz
    zip
 ];

  system.stateVersion = "26.05"; 

}
