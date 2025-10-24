{
  self,
  username,
  overlays,
  ...
}: {
  programs.fish = {
    enable = true;
    vendor = {
      completions.enable = true;
      config.enable = true;
      functions.enable = true;
    };
  };

  system = {
    configurationRevision = self.rev or self.dirtyRev or null;

    stateVersion = 6;

    primaryUser = username;
  };

  nixpkgs.overlays = overlays;
  nixpkgs.config.allowUnfree = true;

  nix.enable = false;
  determinate-nix.customSettings = {
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "jasonxue1.cachix.org-1:3Lba8nYWxm/CfZlES29xVoaQLE5uHsoHgl2YfntmVns="
    ];
    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store/"
      "https://nix-community.cachix.org"
      "https://jasonxue1.cachix.org"
      "https://cache.nixos.org"
    ];
  };
  users.users.${username}.home = "/Users/${username}";

  security.sudo.extraConfig = ''
    Defaults env_keep += "GITHUB_TOKEN"
    Defaults env_keep += "http_proxy https_proxy all_proxy"
  '';
}
