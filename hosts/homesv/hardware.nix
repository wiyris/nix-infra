{pkgs, ...}: {
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      vpl-gpu-rt
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [intel-vaapi-driver];
  };
  environment.sessionVariables = {LIBVA_DRIVER_NAME = "iHD";};
  environment.systemPackages = with pkgs; [
    intel-gpu-tools
    libva-utils
  ];
}
