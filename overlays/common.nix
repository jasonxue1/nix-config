{inputs}: [
  # rust-overlay provides pkgs.rust-bin and related toolchains
  inputs.rust-overlay.overlays.default
  # Provide pkgs.jasonPkgs from custom nixpkgs fork
  (
    _: prev: {
      jasonPkgs = import inputs.jason-nixpkgs {inherit (prev) system;};
    }
  )
  # Provide pkgs.master from nixpkgs master
  (
    _: prev: {
      master = import inputs.nix-master {inherit (prev) system;};
    }
  )
]
