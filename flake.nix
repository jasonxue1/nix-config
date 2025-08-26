{
  # Entrypoint flake for this nix-darwin + Home Manager setup.
  description = "nix-darwin system flake";

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

  outputs = inputs @ {
    self,
    nix-darwin,
    catppuccin,
    sops-nix,
    nixpkgs,
    home-manager,
    rust-overlay,
    nix-homebrew,
    homebrew-cask,
    ...
  }: let
    system = "x86_64-darwin";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [rust-overlay.overlays.default];
      config = {
        allowUnfree = true;
      };
    };
    username = "jason";
  in {
    darwinConfigurations."jason-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      specialArgs = {inherit self pkgs inputs;};
      modules = [
        ./darwin.nix
        home-manager.darwinModules.home-manager

        nix-homebrew.darwinModules.nix-homebrew
        ({...}: {
          nix-homebrew = {
            enable = true;
            user = username;

            taps = {
              "homebrew/homebrew-cask" = homebrew-cask;
            };
            mutableTaps = false;
          };
        })
        ({config, ...}: {
          homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
        })
        ./brew.nix

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {inherit inputs;};
          home-manager.users.jason = {
            imports = [
              ./home
              catppuccin.homeModules.catppuccin
              sops-nix.homeManagerModules.sops
            ];
          };
        }
      ];
    };

    # Formatter used by `nix fmt`.
    formatter.${system} = pkgs.alejandra;
  };
}
