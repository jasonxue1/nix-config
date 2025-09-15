{
  # Entrypoint flake for this nix-darwin + Home Manager setup.
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-master.url = "github:NixOS/nixpkgs/master";
    jason-nixpkgs.url = "github:jasonxue1/nixpkgs/master";
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
    topiary-nushell = {
      url = "github:blindFS/topiary-nushell";
      flake = false;
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    catppuccin-tmtheme = {
      url = "github:catppuccin/bat";
      flake = false;
    };
  };

  outputs = {self, ...} @ inputs: let
    # Single user to support across all hosts
    username = "jason";

    # Create pkgs with consistent overlays and config for a given system
    mkPkgs = system:
      import inputs.nixpkgs {
        inherit system;
        overlays = import ./overlays/common.nix {inherit inputs;};
        config = {allowUnfree = true;};
      };

    # Common Home Manager modules shared by macOS and Linux
    homeModulesBase = [
      ./base
      inputs.catppuccin.homeModules.catppuccin
      inputs.sops-nix.homeManagerModules.sops
    ];

    linuxSystem = "x86_64-linux";
  in {
    darwinConfigurations."jason-MacBook-Pro" = inputs.nix-darwin.lib.darwinSystem {
      # Explicit evaluation system for this host (detected as x86_64)
      system = "x86_64-darwin";
      specialArgs = {inherit self inputs username;};
      modules = [
        ./modules/darwin/system.nix
        inputs.home-manager.darwinModules.home-manager

        inputs.nix-homebrew.darwinModules.nix-homebrew
        ({...}: {
          nix-homebrew = {
            enable = true;
            user = username;

            taps = {
              "homebrew/homebrew-cask" = inputs.homebrew-cask;
            };
            mutableTaps = false;
          };
        })
        ({config, ...}: {
          homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
        })
        ./modules/darwin/homebrew.nix

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {inherit inputs username;};
          home-manager.users.${username} = {
            imports = homeModulesBase ++ [ ./darwin ];
          };
        }
      ];
    };

    # Linux home-manager host (standalone, single machine)
    homeConfigurations = {
      "${username}@linux" = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = mkPkgs linuxSystem;
        modules =
          homeModulesBase
          ++ [
            ./linux
            ({...}: {
              home.username = username;
              home.homeDirectory = "/home/${username}";
            })
          ];
        extraSpecialArgs = {inherit inputs username;};
      };
    };

    # Formatter used by `nix fmt` for both systems.
    formatter.x86_64-darwin = (mkPkgs "x86_64-darwin").alejandra;
    formatter.aarch64-darwin = (mkPkgs "aarch64-darwin").alejandra;
    formatter.x86_64-linux = (mkPkgs "x86_64-linux").alejandra;
  };
}
