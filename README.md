# nix-dotfiles
# nix-admin macOS Configuration

This flake is intended for use by the `nix-admin` user on a Mac to configure system-wide settings and install core applications.

## 🛠️ Prerequisites

Before using this flake, ensure the following are installed on the system:

- **Nix** must be installed (using [the Determinate Nix Installer](https://zero-to-nix.com/concepts/nix-installer/) multi-user installation] is recommended).
- **Git** must be installed.
  - To check: open Terminal and run `git --version`
  - If Git is not installed, macOS will prompt you to install the Apple command-line developer tools, which includes Git.

## 📁 Installation Location

This flake should be cloned into:

```
/Users/nix-admin/.nix-config
```

## 🚀 Getting Started: Initial Setup for `nix-admin`

1. **Log in as `nix-admin`** (either via Fast User Switching or GUI).

2. **Ensure Nix is installed** (using the multi-user install):

   * Follow official instructions: [https://nixos.org/download.html](https://nixos.org/download.html)

3. **Log into the Mac App Store**:

   * Open the App Store app.
   * Sign in with your Apple ID (needed for `mas` to work).

4. **Clone this repo**:

   ```zsh
   git clone https://your-repo-url /Users/nix-admin/.nix-config
   cd /Users/nix-admin/.nix-config
   ```

5. **Apply the configuration**:

   ```zsh
   darwin-rebuild switch --flake .
   ```

## 🧪 Installed Examples

* `htop` (via nixpkgs)
* `raycast` (via Homebrew cask)
* `Magnet` (via MAS; App Store login required)

## 🧼 Notes

* This flake is intentionally minimal for initial testing.
* Home Manager is **not** included.
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
