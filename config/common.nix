{ pkgs, lib, ... }:

{
  options = {
    gaming = lib.mkEnableOption "gaming on this host";
  };

  config = {
    nix = {
      settings = {
        experimental-features = [ "nix-command" "flakes" ];
        flake-registry = "";
      };
      channel.enable = false;
    };
    
    environment = {
      systemPackages = [ pkgs.git ]; # need git to manage this config
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
}