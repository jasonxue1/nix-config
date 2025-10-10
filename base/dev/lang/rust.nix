{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    rust-bin.stable.latest.complete
    cargo-binstall
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
    wasm-pack
    wasm-bindgen-cli
    binaryen
    wabt
    wasmtime
  ];

  home.sessionPath = [
    "${config.home.homeDirectory}/.cargo/bin"
  ];
}
