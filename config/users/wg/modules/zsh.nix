{ config, lib, ... }:

{
  options = {
    modules.zsh.enable = lib.mkEnableOption "zsh";
  };

  config = lib.mkIf config.modules.steam.enable {
    programs.zsh = { # shell with plugins
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history.path = "$HOME/.cache/zsh_history";
      shellAliases = {
        ll = "ls -la";
      };
      oh-my-zsh = { # zsh plugin manager
        enable = true;
        plugins = [ "git" ];
      };
    };
  };
}