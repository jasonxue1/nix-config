{pkgs, ...}: {
  home.packages = with pkgs; [
    pnpm
    nodejs_24
    vscode-langservers-extracted
    vscode-js-debug
    vtsls
  ];
}
