{pkgs, ...}: {
  programs.rbw = {
    enable = true;
    settings = {
      email = "37-blaring.zodiac@icloud.com";
      pinentry = pkgs.pinentry-curses;
    };
  };
}

