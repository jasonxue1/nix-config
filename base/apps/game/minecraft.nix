{pkgs, ...}: {
  home.packages = with pkgs; [
    # prismlauncher
    cubiomes-viewer
  ];
}
