{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode-langservers-extracted
    vscode-js-debug
    vtsls
    eslint
    prettierd
  ];
}
