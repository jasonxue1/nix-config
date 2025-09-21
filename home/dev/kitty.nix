{config, ...}: {
  # Kitty terminal configuration (font, UI, and shell).
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "Maple Mono NF CN";
      bold_font = "auto";
      italic_font = "auto";
      font_size = "13.0";
      force_ltr = "yes";
      disable_ligatures = "always";

      cursor_trail = 4;
      mouse_hide_wait = 2.0;

      hide_window_decorations = "titlebar-only";
      window_padding_width = 5;
      enable_audio_bell = "no";

      macos_option_as_alt = "yes";
      macos_quit_when_last_window_closed = "yes";
      macos_window_resizable = "yes";
      remember_window_size = "yes";

      shell = config.home.sessionVariables.SHELL;

      background_opacity = "1.0";
      allow_remote_control = "yes";

      tab_bar_edge = "top";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "'({index}) {title}'";
    };

    keybindings = {
      "option+c" = "close_window";
      "option+n" = "next_window";
      "option+p" = "previous_window";
      "option+l" = "next_tab";
      "option+h" = "previous_tab";
      "option+w" = "new_tab";
      "cmd+l" = "next_layout";
      "cmd+h" = "last_used_layout";
      "cmd+o" = "toggle_layout stack";
      "option+u" = "open_url_with_hints";
    };
  };
}
