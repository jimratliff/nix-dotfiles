{
  description = "Minimal nix-admin flake for initial system-wide setup on macOS.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:LnL7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin, ... }: {
    darwinConfigurations.default = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        system = "aarch64-darwin";
        config.allowUnfree = true;
      };

      modules = [
        ({ config, pkgs, ... }: {
          environment.systemPackages = with pkgs; [ htop ];

          homebrew.enable = true;
          homebrew.brews = [ "mas" ];
          homebrew.casks = [ "raycast" ];
          homebrew.masApps = {
            "Magnet" = 441258766;
          };

          programs.zsh.enable = true;
          services.nix-daemon.enable = true;
        })
      ];
    };
  };
}
