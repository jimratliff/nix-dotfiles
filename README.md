# nixadmin macOS configuration

This flake is intended for use by the `nixadmin` user on a Mac to configure system-wide settings and install core applications.

## 📁 Installation location

This flake should be cloned into:

```
/Users/nixadmin/.nix-config
```

## 🚀 Getting started: initial setup for `nixadmin`

1. Log in to the `nixadmin` user account

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
   git clone https://github.com/jimratliff/nix-dotfiles.git /Users/nixadmin/.nix-config
   cd /Users/nixadmin/.nix-config
   ```

6. Apply the configuration:
   ```zsh
   darwin-rebuild switch --flake .
   ```

## 🧪 Installed Examples

* `htop` (via **Nixpkgs**)
* `raycast` (via **Homebrew Cask**)
* `Magnet` (via **MAS; App Store login required)

## 🧼 Notes

* This flake is intentionally minimal for initial testing.
* Home Manager is *not* included.
* Trampoline scripts for Spotlight indexing are not handled yet.

## 🔄 Optional: Preparing for Multi-User Home Manager
If this flake is later used by other users (e.g., to apply shared Home Manager configurations), then:
```zsh
chmod -R o+rX /Users/nixadmin/.nix-config
sudo ln -s /Users/nixadmin/.nix-config /etc/nix-config
```

This ensures the flake is readable and easily accessible across users.

---

You can now safely layer on additional packages and configuration after confirming this minimal setup works.
