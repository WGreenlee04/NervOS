{ ... }:

{
  imports = [
    ./modules/default.nix
  ];

  modules = {
    boot.enable = true;
    networking.enable = true;
  };
}