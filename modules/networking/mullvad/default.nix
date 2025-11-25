{
  config,
  lib,
  ...
}:
let
  cfg = config.networking'.mullvad;
in
{
  # https://wiki.nixos.org/wiki/Mullvad_VPN
  options.networking'.mullvad.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    services.mullvad-vpn = {
      enable = true;
    };
  };
}
