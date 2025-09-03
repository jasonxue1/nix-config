{pkgs, ...}: {
  home.packages = with pkgs; [
    emmet-ls
    vscode-langservers-extracted
    prettierd
    prettier
    http-server
  ];
}
