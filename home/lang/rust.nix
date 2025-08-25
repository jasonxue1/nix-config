{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    lldb_21
    rust-bin.stable.latest.default
    cargo-binstall
    rust-analyzer
    # use mold in Linux
    pkg-config
    cargo-edit
    cargo-outdated
    cargo-audit
    cargo-udeps
    cargo-watch
    cargo-nextest
    cargo-deny
    cargo-bloat
    cargo-expand
    cargo-llvm-lines
    cargo-insta
    cargo-tarpaulin
    cargo-modules
    cargo-fuzz
    cargo-criterion
    cargo-make
    cargo-release
    cargo-benchcmp
  ];

  home.sessionPath = [
    "${config.home.homeDirectory}/.cargo/bin"
  ];
}
