{
  description = "Minimal nix-admin flake for initial system-wide setup on macOS.";

# This flake assumes that nix was installed using the Determinate Installer.

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
          system.stateVersion = 6;
          nix.enable = false;
          environment.systemPackages = with pkgs; [ 
            mkalias        # Quick'n'dirty tool to make APFS aliases
            # GUI applications
            _1password-gui # Multi-platform password manager
            brave          # Privacy-oriented browser for Desktop and Laptop computers
            calibre        # Comprehensive e-book software
            discord        # All-in-one cross-platform voice and text chat for gamers
            dropbox        # Online stored folders (daemon version)
            firefox        # Web browser built from Firefox source tree
            git            # Distributed version control system. (More up to date than that supplied by macOS.)
            iterm2         # Replacement for Terminal and the successor to iTerm
            vls            # Cross-platform media player and streaming server
            vscode         # Open source source code editor developed by Microsoft for Windows, Linux and macOS 
                           #   Note: There is also `vscode-with-extensions`. I can’t tell the two apart.
            warp-terminal  # Rust-based terminal
            zoom-us        # zoom.us video conferencing application
            zotero         # Collect, organize, cite, and share your research sources
          ];

          homebrew.enable = true;
          homebrew.brews = [ "mas" ];
          homebrew.casks = [ "raycast" ];
          homebrew.masApps = {
            "Magnet" = 441258766;
          };

          programs.zsh.enable = true;
        })
      ];
    };
  };
}
