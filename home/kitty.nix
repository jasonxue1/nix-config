{pkgs, ...}: {
  # Kitty terminal configuration (font, UI, and shell).
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "Maple Mono NF CN";
      bold_font = "auto";
      italic_font = "auto";
      font_size = "15.0";
      force_ltr = "yes";

      cursor_trail = 4;
      mouse_hide_wait = 2.0;

      tab_bar_edge = "top";
      tab_bar_style = "powerline";

      hide_window_decorations = "titlebar-only";
      window_padding_width = 15;
      remember_window_size = "yes";

      macos_option_as_alt = "yes";
      macos_quit_when_last_window_closed = "yes";

      shell = "${pkgs.zsh}/bin/zsh";

      background_opacity = "1.0";
      allow_remote_control = "yes";
    };
  };
}
