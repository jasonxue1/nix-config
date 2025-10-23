{pkgs, ...}: {
  home.packages = with pkgs; [
    pnpm
    yarn
    yarn2nix
    nodejs_24
    node2nix
    vscode-langservers-extracted
    vscode-js-debug
    vtsls
  ];
}
