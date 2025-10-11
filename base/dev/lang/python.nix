{pkgs, ...}: {
  home.packages = with pkgs; [
    uv
    ruff
    basedpyright
    python3Packages.debugpy
  ];
}
