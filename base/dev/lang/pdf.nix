{pkgs, ...}: {
  home.packages = with pkgs; [
    ghostscript
  ];
  programs.zathura = {
    enable = true;
  };
}
