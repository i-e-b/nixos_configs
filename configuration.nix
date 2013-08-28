# This is a generated file.  Do not modify!
# Make changes to /etc/nixos/configuration.nix instead.
{ config, pkgs, ... }:

{
  require = [
    ./hardware-configuration.nix
    <nixos/modules/installer/scan/not-detected.nix>
    <nixos/modules/programs/virtualbox.nix>
  ];

  boot.loader.grub.device = "/dev/sdb";  # for 2-disk work machine
  #boot.loader.grub.device = "/dev/sda";

 # These for Virtual box images only -- use hardware-configuration.nix for real machines
 # boot.initrd.kernelModules = [ "ata_piix" "ohci_hcd" ];
 # boot.kernelModules = [ ];
 # boot.extraModulePackages = [ ];

  environment.systemPackages = with pkgs; [
    wget vimHugeX sudo
    manpages
    gitAndTools.gitFull
    haskellPackages.ghc
    haskellPackages.haskellPlatform
    iptables nmap tcpdump
    rxvt_unicode
  ];

  environment.x11Packages = with pkgs; [
    chromium
    firefoxWrapper
    trayer
    haskellPackages.xmobar
    haskellPackages.xmonad
    haskellPackages.xmonadContrib
    haskellPackages.xmonadExtras
    dmenu
    xscreensaver
    xclip
    #virtualbox   # This is done with the require reference at the top.

    #wacom!
    #xf86_input_wacom
    #xsetwacom
  ];

  nix.maxJobs = 4;
  time.timeZone = "Europe/London";

  services.openssh.enable = true;
  #services.virtualbox.enable = true;

  networking.interfaceMonitor.enable = true;
  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "uk";
    defaultLocale = "en_GB.UTF-8";
  };

  # User account
  users.extraGroups.wheel.gid = 0;
  users.extraUsers.iain = {
    createHome = true;
    home = "/home/iain";
    description = "Iain Ballard";
    extraGroups = [ "wheel" "disk" "vboxusers" "cdrom" ];
    isSystemUser = false;
    useDefaultShell = true;
  }; 
  security.sudo.enable = true;

  services.xserver = {
    enable = true;
    layout = "gb";
    windowManager.xmonad.enable = true;
    windowManager.default = "xmonad";
    desktopManager.xterm.enable = false;
    desktopManager.default = "none";
    startOpenSSHAgent = true;
    displayManager = {
      slim = {
	enable = true;
	defaultUser = "iain";
      };
    };
    wacom.enable = true;
  };

  services.printing.enable = true;
  # Show the manual on virtual console 8 :
  services.nixosManual.showManual = true;

  fileSystems = [
    { mountPoint = "/";
      label = "nixos";
    }
  ];
  swapDevices = [
    { device = "/dev/disk/by-label/swap"; }
  ];
}
