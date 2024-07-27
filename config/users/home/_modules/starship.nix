{ config, lib, ... }:

let
  cfg = config.modules.starship;
in
{
  options.modules.starship = {
    enable = lib.mkEnableOption "starship";
  };

  config = lib.mkIf cfg.enable {
    programs.starship.enable = true; # shell theme
  };
}
