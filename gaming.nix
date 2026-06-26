{ pkgs, config, ... }:
{
  imports = [
  ];

  options = {
  };

  config = {
    programs.steam = {
      enable = true; # install steam
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };

environment.systemPackages = with pkgs; [

gamemode
gamescope
goverlay
heroic-unwrapped
mangohud
steam-run
wineWow64Packages.stable
winetricks
(lutris.override {
        extraLibraries =  pkgs: [
          pkgs.vulkan-loader
          pkgs.gnutls
          pkgs.glib-networking
        ];
      })
];
  };
}
