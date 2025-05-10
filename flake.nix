{
  description = "Minimal nix-admin flake for initial system-wide setup on macOS.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    darwin.url = "github:LnL7/nix-darwin";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, darwin, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        darwinConfigurations.default = darwin.lib.darwinSystem {
          inherit system;
          modules = [
            ({ config, pkgs, ... }: {
              environment.systemPackages = with pkgs; [
                htop             # Example nixpkg
              ];

              homebrew.enable = true;
              homebrew.brews = [ "mas" ];           # Needed for MAS app installs
              homebrew.casks = [ "raycast" ];        # Example Homebrew GUI app
              homebrew.masApps = {
                "Magnet" = 441258766;                 # Example MAS app
              };

              programs.zsh.enable = true;
              services.nix-daemon.enable = true;
            })
          ];
        };
      });
}
