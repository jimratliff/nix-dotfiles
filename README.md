# nix-admin macOS configuration

This flake is intended for use by the `nix-admin` user on a Mac to configure system-wide settings and install core applications.

## 📁 Installation location

This flake should be cloned into:

```
/Users/nix-admin/.nix-config
```

## 🚀 Getting started: initial setup for `nix-admin`

1. Log in to the `nix-admin` user account

2. Ensure Nix is installed:
  - To check: open Terminal and run `nix --version`
  - If Nix is not installed, install it, preferably using [the Determinate Nix Installer](https://zero-to-nix.com/concepts/nix-installer/).
  
3. Ensure Git is installed:
  - To check: open Terminal and run `git --version`
  - If Git is not installed, macOS will prompt you to install the Apple command-line developer tools, which includes Git.

4. Log into the Mac App Store:
  - Open the App Store app.
  - Sign in with your Apple ID (needed for `mas` to work).

5. Clone this repo:
   ```zsh
   git clone https://github.com/jimratliff/nix-dotfiles.git /Users/nix-admin/.nix-config
   cd /Users/nix-admin/.nix-config
   ```

6. Apply the configuration:
   If this is the **first time** you’re applying the configuration on a new machine, the `darwin-rebuild` tool won’t be installed yet. Instead, run:
   ```zsh
   nix build .#darwinConfigurations.default.system
   ./result/sw/bin/darwin-rebuild switch --flake .#default
   ```
   On subsequent runs, once `darwin-rebuild` is installed into the system profile, you can use the simpler form:
   ```zsh
   darwin-rebuild switch --flake .
   ```

## 🧪 Installed Examples

* `htop` (via **Nixpkgs**)
* `raycast` (via **Homebrew Cask**)
* `Magnet` (via **MAS**; App Store login required)

## 🧼 Notes

* This flake is intentionally minimal for initial testing.
* Home Manager is *not* included.
* Trampoline scripts for Spotlight indexing are not handled yet.

## 🔄 Optional: Preparing for Multi-User Home Manager
If this flake is later used by other users (e.g., to apply shared Home Manager configurations), then:
```zsh
chmod -R o+rX /Users/nix-admin/.nix-config
sudo ln -s /Users/nix-admin/.nix-config /etc/nix-config
```

This ensures the flake is readable and easily accessible across users.

---

You can now safely layer on additional packages and configuration after confirming this minimal setup works.
