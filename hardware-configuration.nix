# This is a generated file.  Do not modify!
# Make changes to /etc/nixos/configuration.nix instead.
{ config, pkgs, ... }:

{
  require = [
    <nixos/modules/installer/scan/not-detected.nix>
  ];

  boot.initrd.kernelModules = [ "ehci_hcd" "ahci" "usbhid" ];
  boot.kernelModules = [ "kvm-intel" "wacom" ];
  boot.extraModulePackages = [ ];

  nix.maxJobs = 4;
}
