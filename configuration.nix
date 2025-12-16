{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      ./starship.nix
      ./greeter.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "7357"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Taipei";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Temp install niri
  programs.niri.enable = true;
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.arshes = {
    isNormalUser = true;
    description = "arshes";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  fonts.packages = with pkgs;[
    nerd-fonts.atkynson-mono
  ];
  fonts.fontDir.enable = true;

  console.font = "ter-124b";
  console.packages = with pkgs; [
    nerd-fonts.intone-mono
  ];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    tuigreet
    lazygit
    rofi
    wget
    helix
    git
    librewolf
    htop
    bat
    duf
    starship
    ghostty
    fuzzel
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
      PasswordAuthentication = true;
    };
  };
  

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  nix.settings.experimental-features = [ "nix-command" "flakes"];
  system.stateVersion = "25.11"; # Did you read the comment?

}
