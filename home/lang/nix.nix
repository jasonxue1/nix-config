{pkgs, ...}: {
  # Nix language tools and formatters
  home.packages = with pkgs; [
    nixd
    nixfmt
    deadnix
    statix
    alejandra
  ];
}
