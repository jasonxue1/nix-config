{pkgs, ...}: {
  home.packages = with pkgs; [
    prettierd
    vscode-langservers-extracted
    jq
  ];
}
