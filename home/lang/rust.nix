{pkgs, ...}: {
  home.packages = with pkgs; [
    rustc
    cargo
    rustfmt
    clippy
    pkg-config
    rust-analyzer
    cargo-binstall
  ];
}
