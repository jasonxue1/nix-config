{pkgs, ...}: {
  home.packages = with pkgs; [
    jason.clash-verge-rev
  ];
}
