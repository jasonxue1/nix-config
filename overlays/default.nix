{inputs, ...}: [
  inputs.rust-overlay.overlays.default
  inputs.jason-overlay.overlays.default
  (final: _: {
    nix-olde = inputs.nix-olde.packages.${final.system}.default;
  })
]
