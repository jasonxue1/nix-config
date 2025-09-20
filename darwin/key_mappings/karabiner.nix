{pkgs, ...}: {
  xdg.configFile."karabiner".source = ./karabiner;
  home.packages = with pkgs; [
    jasonPkgs.karabiner-elements_14
  ];
}
