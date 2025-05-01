# 🚀 NixOS Nvim

> Declarative NixOS module to provision Neovim with a Lua-based config scaffold, Catppuccin mocha green theme and essential plugins.

## 📦 Features

- 🔒 **Secure config scaffold :** Creates ```~/.config/nvim``` and subdirectories with ```700```/```600``` permissions.

- 🎨 **Catppuccin mocha green :** Deploys ```catppuccin.lua``` theme in ```lua/plugins```.

- ⚙️ **Plugin templates :** Includes starter configs for ```blink```, ```conform```, ```gitsigns```, ```lazydev```, ```LSP```, ```treesitter```, ```telescope```, ```todo-comments```, ```which-key``` and more.

- 🚀 **Language support :** Installs ```go```, ```rustup```, ```python3```, ```ruby``` for LSP and tooling.

- 📋 **Clipboard integration :** Adds ```xclip``` and ```copyq``` for system clipboard support.

- 🔄 **Idempotent :** Safe to run on every ```nixos-rebuild```, preserves and updates config files.

- 🔮 **Evolving :** Configuration is under active development—expect frequent improvements.

- 💾 **Manual backups :** Backup commands are provided in the documentation to preserve existing files before changes if needed.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/nvim{,.bak}
```

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-nvim = fetchGit {
    url = "https://github.com/typovrak/nixos-nvim.git";
    ref = "main";
    rev = "eea0e1d5fb671859b6729c2c788fad3d68de4eea"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-nvim}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

## 🎬 Usage

Start coding now with ```nvim``` !

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
