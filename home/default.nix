{config, ...}: {
  # Home Manager entrypoint: packages, session vars, and module imports.
  home.stateVersion = "25.05";
  home.shellAliases = {
    v = "nvim";
    lg = "lazygit";
    nixfmt = "nix fmt --no-write-lock-file";
    ls = "eza --icons=auto";
    ll = "eza -lg --icons=auto";
    tn = "tmux new -s";
    ta = "tmux a -t";
    y = "yazi";
    cd = "z";
    fzf = "sk";
  };
  home.sessionPath = [
    "/etc/profiles/per-user/${config.home.username}/bin"
    "${config.home.homeDirectory}/.nix-profile/bin"
    "/run/current-system/sw/bin"
    "/nix/var/profiles/default/bin"
    "/usr/local/bin"
  ];
  home.sessionVariables = {
    https_proxy = "http://127.0.0.1:7897";
    http_proxy = "http://127.0.0.1:7897";
    all_proxy = "socks5h://127.0.0.1:7897";
  };

  imports = [
    ./neovim
    ./kitty.nix
    ./shell
    ./catppuccin.nix
    ./lang
    ./git.nix
    ./tools
    ./secrets
    ./tmux
    ./firefox.nix
    ./fonts.nix
    ./key_mappings
    ./social.nix
    ./scripts
  ];
}
