{config, pkgs, options, lib, ...}:
let
  overlay = (import ./overlay.nix);
  cfg = config.services.rogauracore;
in
{
  options.services.rogauracore = {
    enable = lib.mkEnableOption "rogauracore";
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.overlays = [ overlay ];
    environment.systemPackages = with pkgs; [
      rogauracore
    ];
    services.udev.packages = [
      pkgs.rogauracore
    ];
  };
}