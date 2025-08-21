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
    topiary_nushell = {
      url = "github:blindFS/topiary-nushell";
      flake = false;
    };
  };

  outputs = {
    self,
    nix-darwin,
    catppuccin,
    sops-nix,
    nixpkgs,
    topiary_nushell,
    home-manager,
    ...
  }: let
    system = "x86_64-darwin";
    pkgs = import nixpkgs {inherit system;};
  in {
    darwinConfigurations."jason-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      specialArgs = {inherit self;};
      modules = [
        ./darwin.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {inherit topiary_nushell;};
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
