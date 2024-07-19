{ pkgs, config, ... }:

{
  nixpkgs.config.allowUnfree = true;
 
  programs = {
    steam = { # easiest way to install steam
      enable = config.global.gaming; # enable it if the host supports gaming
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
  
  # User setup
  users.users.wg = {
    isNormalUser = true;
    extraGroups = [ "wheel" ] 
    ++ (if config.networking.networkmanager.enable then [ "networkmanager" ] else []);
    initialPassword = "";
  };

  # Home Manager
  home-manager.users.wg = import ./wg/home.nix;
}
