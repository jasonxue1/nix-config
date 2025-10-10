{
  pkgs,
  self,
  username,
  overlays,
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

  # Track configuration metadata for this host.
  system = {
    configurationRevision = self.rev or self.dirtyRev or null;

    # Bump only after reading nix-darwin changelog.
    stateVersion = 6;

    primaryUser = username;
  };

  # Ensure required overlays are present (shared list).
  nixpkgs.overlays = overlays;
  nixpkgs.config.allowUnfree = true;

  # Nix daemon settings and substituters.
  nix.enable = false;

  # Local user definition.
  users.users.${username}.home = "/Users/${username}";

  # Preserve selected env vars for sudo sessions.
  security.sudo.extraConfig = ''
    Defaults env_keep += "GITHUB_TOKEN"
    Defaults env_keep += "http_proxy https_proxy all_proxy"
  '';
}
