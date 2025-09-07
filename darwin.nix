{
  pkgs,
  self,
  ...
}: {
  # System-level settings for this nix-darwin host.

  # Core packages available system-wide.
  environment.systemPackages = with pkgs; [
    vim
    cachix
  ];
  programs.fish = {
    enable = true;
    vendor = {
      completions.enable = true;
      config.enable = true;
      functions.enable = true;
    };
  };

  # Track configuration revision for `darwin-version`.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Bump only after reading nix-darwin changelog.
  system.stateVersion = 6;

  # Explicit host platform.
  nixpkgs.hostPlatform = "x86_64-darwin";

  # Nix daemon settings and substituters.
  nix = {
    optimise.automatic = true;
    settings = {
      substituters = [
        "https://mirrors.ustc.edu.cn/nix-channels/store/"
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store/"
        "https://cache.nixos.org/"
      ];
      trusted-substituters = [
        "https://mirrors.ustc.edu.cn/nix-channels/store/"
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store/"
      ];
      fallback = true;
      connect-timeout = 10;
      http-connections = 4;
      max-substitution-jobs = 4;
      experimental-features = "nix-command flakes";
    };
  };

  # Local user definition.
  users.users.jason.home = "/Users/jason";

  # Preserve selected env vars for sudo sessions.
  security.sudo.extraConfig = ''
    Defaults env_keep += "GITHUB_TOKEN"
    Defaults env_keep += "http_proxy https_proxy all_proxy"
  '';

  system.primaryUser = "jason";
}
