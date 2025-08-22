{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    rustc
    cargo
    rustfmt
    clippy
    pkg-config
    rust-analyzer
    cargo-binstall
  ];
  home.sessionPath = [
    "${config.home.homeDirectory}/.cargo/bin"
  ];
}
