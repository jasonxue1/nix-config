{pkgs, ...}: {
  # Nix language tools and formatters
  home.packages = with pkgs; [
    nixd
    deadnix
    statix
    alejandra
  ];
}
