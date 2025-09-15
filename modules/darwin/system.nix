{
  pkgs,
  self,
  username,
  inputs,
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

  # Use default host platform from darwinSystem; no override here to avoid recursion.

  # Ensure required overlays are present (shared list).
  nixpkgs.overlays = import ../../overlays/common.nix {inherit inputs;};
  nixpkgs.config.allowUnfree = true;

  # Nix daemon settings and substituters.
  nix = {
    optimise.automatic = true;
    settings = {
      substituters = [
        "https://mirrors.ustc.edu.cn/nix-channels/store/"
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store/"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
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
      download-buffer-size = 1048576;
    };
  };

  # Local user definition.
  users.users.${username}.home = "/Users/${username}";

  # Preserve selected env vars for sudo sessions.
  security.sudo.extraConfig = ''
    Defaults env_keep += "GITHUB_TOKEN"
    Defaults env_keep += "http_proxy https_proxy all_proxy"
  '';

  system.primaryUser = username;
}
