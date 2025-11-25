{
  config,
  lib,
  ...
}:
let
  cfg = config.programs'.git;
  inherit (config.globals) homeDirectory;
in
{
  options.programs'.git.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      programs.git = {
        enable = true;
        userName = "wiyris";
        userEmail = "c8b5805d-928f-4c0b-8fc0-27817abedf44@passmail.com";
        extraConfig.init.defaultBranch = "main";
        signing = {
          format = "ssh";
          key = "${homeDirectory}/.ssh/id_ed25519";
          signByDefault = true;
        };
        # settings = {
        #   user = {
        #     name = "wiyris";
        #     email = "c8b5805d-928f-4c0b-8fc0-27817abedf44@passmail.com";
        #   };
        #   color.ui = true;
        #   init.defaultBranch = "main";
        # };
      };
    };
  };
}
