{
  description = "Nixxy Niri";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-un.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs-un";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs-un";
    };  
      
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = inputs@{
    self,
    nixpkgs,
    home-manager,
    ...
  }: {
    nixosConfigurations.rapture =
      nixpkgs.lib.nixosSystem
      {
        system = "x86_64-linux";
        specialArgs = { inherit inputs;};
        modules = [
          ./configuration.nix
          ./noctalia.nix
          # inputs.noctalia.nixosModules.default
          home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.arshes = import ./home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}




