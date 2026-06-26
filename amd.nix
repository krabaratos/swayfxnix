{ config, pkgs, ... }:

{
    #AMD GPU Drivers
   hardware.graphics = {
    enable = true;
    enable32Bit = true;
 };

  #AMD GPU Driver Packages
  environment.systemPackages = with pkgs; [
  gnutls
  libGL
  mesa
  pkgsi686Linux.gnutls
  vulkan-extension-layer
  vulkan-loader
  vulkan-tools
  vulkan-validation-layers

  ];
}
