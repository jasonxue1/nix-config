{
  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    determinate = {
      url = "github:DeterminateSystems/determinate";
      inputs = {
        nix.inputs.nixpkgs.follows = "nixpkgs";
        nixpkgs.follows = "nixpkgs";
      };
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    jason-overlay = {
      url = "github:jasonxue1/jason-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, ...} @ inputs: let
    username = "jason";

    overlays = import ./overlays {inherit inputs;};

    mkPkgs = system:
      import inputs.nixpkgs {
        inherit system overlays;
        config = {allowUnfree = true;};
      };

    homeModulesBase = [
      ./base
      inputs.catppuccin.homeModules.catppuccin
      inputs.sops-nix.homeManagerModules.sops
    ];

    linuxSystem = "x86_64-linux";
  in {
    darwinConfigurations."jason-MacBook-Pro" = inputs.nix-darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      specialArgs = {inherit self inputs username overlays;};
      modules = [
        ./modules/darwin/system.nix
        inputs.home-manager.darwinModules.home-manager
        inputs.determinate.darwinModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs username;};
            users.${username} = {
              imports = homeModulesBase ++ [./darwin];
            };
          };
        }
      ];
    };

    homeConfigurations = {
      "${username}@linux" = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = mkPkgs linuxSystem;
        modules =
          homeModulesBase
          ++ [
            ./linux
            (_: {
              home.username = username;
              home.homeDirectory = "/home/${username}";
            })
          ];
        extraSpecialArgs = {inherit inputs username;};
      };
    };
  };
}
