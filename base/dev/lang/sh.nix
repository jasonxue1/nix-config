{pkgs, ...}: {
  home.packages = with pkgs; [
    shfmt
    bash-language-server
  ];
}

