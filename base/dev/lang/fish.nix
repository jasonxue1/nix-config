{pkgs, ...}: {
  home.packages = with pkgs; [
    fish
    fish-lsp
  ];
}
