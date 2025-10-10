{pkgs, ...}: {
  home.packages = with pkgs; [
    uv
    ruff
    #basedpyright
    pyright
    python3Packages.debugpy
  ];
}
