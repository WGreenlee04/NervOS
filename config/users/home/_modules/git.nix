{ config, lib, ... }:

let
  cfg = config.modules.git;
in
{
  options.modules.git = {
    enable = lib.mkEnableOption "git";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      git = {
        enable = true; # version control
        delta.enable = true; # diff tool
        aliases = { }; # place to add commits # TODO: expose this
      };
      git-credential-oauth.enable = true; # authentication manager
    };
  };
}
