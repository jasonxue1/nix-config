{pkgs, ...}: {
  home.packages = with pkgs; [
    nixd
    nixfmt
    deadnix
    statix
    alejandra
    nixpkgs-hammering
    nixpkgs-review
    nix-update
    nix-info
    nix-output-monitor
    dix
  ];
}
