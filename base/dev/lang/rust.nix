{pkgs, ...}: {
  home.packages = with pkgs; [
    rust-analyzer-nightly
    (fenix.complete.withComponents [
      "cargo"
      "clippy"
      "rust-src"
      "rustc"
      "rustfmt"
    ])
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
    cargo-flamegraph
    binaryen
    wabt
    wasmtime
  ];
}
