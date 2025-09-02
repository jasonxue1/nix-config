{pkgs, ...}: {
  programs.rbw = {
    enable = true;
    package = pkgs.jasonPkgs.rbw;
    settings = {
      email = "37-blaring.zodiac@icloud.com";
      pinentry = pkgs.pinentry-curses;
    };
  };
}
