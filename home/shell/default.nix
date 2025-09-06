{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./zsh
    ./nushell
    ./carapace.nix
    ./starship
  ];

  home = {
    sessionVariables = {
      SHELL = "${pkgs.nushell}/bin/nu";
    };

    shell = {
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };

    sessionVariables = {
      https_proxy = "http://127.0.0.1:7897";
      http_proxy = "http://127.0.0.1:7897";
      all_proxy = "socks5h://127.0.0.1:7897";

      NIX_PATH = "nixpkgs=${pkgs.path}";
      NIX_USER_PROFILE_DIR = "/nix/var/nix/profiles/per-user/$USER";
      NIX_SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
    };

    shellAliases = {
      v = "nvim";
      lg = "lazygit";
      ls = "eza --icons=auto";
      ll = "eza -lg --icons=auto";
      tn = "tmux new -s";
      ta = "tmux a -t";
      y = "yazi";
    };

    sessionPath = [
      "/etc/profiles/per-user/${config.home.username}/bin"
      "${config.home.homeDirectory}/.nix-profile/bin"
      "/run/current-system/sw/bin"
      "/nix/var/profiles/default/bin"
      "/usr/local/bin"
    ];
  };
}
