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
  programs = {
    nh = {
      enable = true;
      clean.enable = true;
    };
    nix-your-shell = {
      enable = true;
      nix-output-monitor.enable = true;
    };
  };
}
