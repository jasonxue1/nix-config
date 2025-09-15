{pkgs, ...}: {
  home.packages = with pkgs; [
    qq
  ];

  programs.iamb = {
    enable = true;
    settings = {
      default_profile = "jason";
      profiles = {
        jason.user_id = "@jasonxue_1:matrix.org";
      };
      settings = {
        image_preview = {
          protocol.type = "kitty";
        };
      };
    };
  };
}

