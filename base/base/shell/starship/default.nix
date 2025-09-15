{...}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = false;
    settings = builtins.fromTOML (builtins.readFile ./nerd-font-symbols.toml);
  };
  catppuccin.starship.enable = false;
}

