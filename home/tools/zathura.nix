{...}: {
  programs.zathura = {
    enable = true;
    extraConfig = ''
      set synctex true
      set stnctex-editor-command "sh -c 'nvr --servername \"$NVIM_LISTEN_ADDRESS\" --remote +%{line} +%{input}'"
    '';
  };
}
