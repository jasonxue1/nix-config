{pkgs, ...}: {
  home.packages = with pkgs; [
    pnpm
    nodejs
    vscode-langservers-extracted
    vscode-js-debug
    vtsls
  ];
}
