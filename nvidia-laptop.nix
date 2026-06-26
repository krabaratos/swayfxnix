{ config, pkgs, lib, ... }:

{
  # Hardware accelerated graphics configurations
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Required for 32-bit games (Steam)

    # Injects Vulkan drivers directly into the system graphics layer for Java/Prism Launcher
    extraPackages = with pkgs; [
      vulkan-loader
      vulkan-validation-layers
      vulkan-extension-layer
    ];


  };

  # Instructs X11/Wayland display servers to load the NVIDIA driver
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Modesetting is required for modern Desktop Environments (KDE Plasma 6, etc.)
    modesetting.enable = true;

    # Automated power suspension options for laptop battery life
    powerManagement.enable = true;
    powerManagement.finegrained = true;

    # Keeps driver stable (Using the proprietary module)
    open = false;

    # Installs the graphical 'nvidia-settings' application
    nvidiaSettings = true;

    # Targets the matching stable driver compilation for your Xanmod kernel
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Optimus PRIME Offload configuration (Runs laptop on AMD iGPU by default)
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      # Bus IDs for your Ryzen 5 5600H and RTX 3060 hardware mix
      # Double-check using: lspci | grep -E "VGA|3D"
      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
