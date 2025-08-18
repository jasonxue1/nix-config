{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nix-darwin,
    catppuccin,
    sops-nix,
    nixpkgs,
    home-manager,
    ...
  }: let
    system = "x86_64-darwin";
    pkgs = import nixpkgs {inherit system;};
    configuration = {pkgs, ...}: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = [
        pkgs.vim
      ];

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "x86_64-darwin";

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

      users.users.jason = {
        home = "/Users/jason";
      };

      security.sudo.extraConfig = ''
        Defaults env_keep += "GITHUB_TOKEN"
        Defaults env_keep += "http_proxy https_proxy all_proxy"
      '';
    };
  in {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#jason-MacBook-Pro
    darwinConfigurations."jason-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jason = {
            imports = [
              ./home/home.nix
              catppuccin.homeModules.catppuccin
              sops-nix.homeManagerModules.sops
            ];
          };
        }
      ];
    };
    formatter.${system} = pkgs.alejandra;
  };
}
