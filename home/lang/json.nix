{pkgs, ...}: {
  home.packages = with pkgs; [
    prettierd
    prettier
    vscode-langservers-extracted
    jq
  ];
}
