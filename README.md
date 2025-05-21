[![NixOS ≥ 24.11](https://img.shields.io/badge/NixOS-24.11%2B-a6e3a1?labelColor=45475a)](https://nixos.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-cba6f7.svg?labelColor=45475a)](LICENSE.md)
[![Buy me a coffee](https://img.shields.io/badge/Buy%20me%20a%20coffee-☕-fab387?labelColor=45475a)](https://typovrak.tv/coffee)
[![Portal](https://img.shields.io/badge/Portal-typovrak.tv%2Fnixos-eba0ac)](https://typovrak.tv/nixos)

# 🚀 NixOS Nvim

> Declarative NixOS module to provision Neovim with a Lua-based config scaffold, Catppuccin mocha green theme and essential plugins.

## 🧩 Part of the Typovrak NixOS ecosystem

This module is part of ```Typovrak NixOS```, a fully modular and declarative operating system configuration built entirely with :

- 🧱 **30+ standalone modules :** Each managing a specific tool, feature or aesthetic like ```zsh```, ```i3```, ```lighdm```, ```polybar```, ```gtk``` and more.
- 🎨 **Catppuccin Mocha :** The default theme across terminal, GUI, and login interfaces.
- 🛡️ **100% FOSS compliant :** No proprietary software included unless explicitly chosen.
- 🧑‍💻 **Built for developers :** Optimized for speed, keyboard-centric workflows and expressive CLI tooling.

*Explore the full system : 👉 [github.com/typovrak/nixos](https://github.com/typovrak/nixos)*

> [!CAUTION]
> This module is opinionated, it may **override**, **replace**, or **remove** files and settings **without** prompt. To avoid unexpected changes, **back up** your existing files or **fork** this module to take full control. **Follow this documentation** to avoid any of this problem.

## 📦 Features

- 🔒 **Secure config scaffold :** Creates ```~/.config/nvim``` and subdirectories with ```700```/```600``` permissions.
- 🎨 **Catppuccin mocha green :** Deploys ```catppuccin.lua``` theme in ```lua/plugins```.
- ⚙️ **Plugin templates :** Includes starter configs for ```blink```, ```conform```, ```gitsigns```, ```lazydev```, ```LSP```, ```treesitter```, ```telescope```, ```todo-comments```, ```which-key``` and more.
- 🚀 **Language support :** Installs ```go```, ```rustup```, ```python3```, ```ruby``` for LSP and tooling.
- 📋 **Clipboard integration :** Adds ```xclip``` and ```copyq``` for system clipboard support.
- 🔄 **Idempotent :** Safe to run on every ```nixos-rebuild```, preserves and updates config files.
- 🔮 **Evolving :** Configuration is under active development—expect frequent improvements.
- 💾 **Manual backups :** Backup commands are provided in the documentation to preserve existing files before changes if needed.

## 📂 Repository structure

```bash
❯ tree -a -I ".git*"
.
├── blink.lua           # auto completion and word suggestions
├── catppuccin.lua      # catppuccin mocha green theme
├── configuration.nix   # module configuration
├── conform.lua         # code formatter
├── gitsigns.lua        # git integration
├── init.lua            # main entry point of the configuration
├── lazydev.lua         # lazy loading for dev tools and lsp
├── LICENSE.md          # MIT license
├── nvim-lspconfig.lua  # base configuration for lsp servers
├── nvim-treesitter.lua # syntax highlighting and parsing via treesitter
├── README.md           # this documentation
├── telescope.lua       # fuzzy finder and navigation
├── todo-comments.lua   # highlights todo, fixme and related comments
└── which-key.lua       # popup help for keybindings

1 directory, 14 files
```

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
The target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/nvim{,.bak}
```

## ⬇️ Installation

### 🚀 Method 1 : Out-of-the-box

Fetch the module directly in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
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

### 🍴 Method 2 : Fork

Want to **personalize** this module ?

Fork it and add this custom module in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
let
  nixos-nvim = fetchGit {
    url = "https://github.com/<YOUR_USERNAME>/nixos-nvim.git";
    ref = "main";
    rev = "<COMMIT>"; # see below
  };
in {
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-nvim}/configuration.nix")
  ];
}
```

Get the latest commit hash by executing
```bash
git clone https://github.com/<YOUR_USERNAME>/nixos-nvim.git &&
cd nixos-nvim &&
git log -1 --pretty=format:"%H"
```

## 🎬 Usage

Start coding now with ```nvim``` !

## 📚 Learn more

- 📘 [Neovim Lua guide](https://neovim.io/doc/user/lua-guide.html) : Learn how to write idiomatic Lua configurations for Neovim.
- 🧠 [Awesome Neovim](https://github.com/rockerBOO/awesome-neovim) : Curated list of plugins, configurations and resources.
- 🛠️ [Neovim documentation](https://neovim.io) : Official reference for all built-in functions and features.
- 🌈 [Catppuccin for Neovim](https://github.com/catppuccin/nvim) : Theme used in this module.
- 🚀 [lazy.nvim](https://lazy.folke.io/) : Fast and modern plugin manager used in this setup.

## 🌐 Discover my NixOS system portal

Dive into [typovrak.tv/nixos](https://typovrak.tv/nixos) Catppuccin mocha green themed **gateway** to my GitHub and NixOS setup.

Browse **every module**, example and config in a sleek with an interactive interface that feels just like your desktop.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://typovrak.tv/coffee)

## 💬 Join the Typovrak community on Discord 🇫🇷

If you've ever ```rm -rf```ed your config by mistake or rebuilt for the 42nd time because a semicolon was missing…

You're not alone, **Welcome home !**

🎯 [Join us on Discord »](https://typovrak.tv/discord)

🧭 What you’ll find is :

- ```💻 #nixos-setup``` - get help with modules, rebuilds and configs.
- ```🌐 #web-dev``` - talk JS, TypeScript, React, Node and more.
- ```🧠 #open-source``` - share your repos, contribute to others and discuss FOSS culture.
- ```⌨️ #typing``` - layouts, mechanical keyboards and speed goals.
- ```🎨 #ricing``` - dotfiles, theming tips and desktop screenshots.

*Everyone's welcome no matter how many times you've broken your system ~~(except for Windows users)~~ 😄*

---

<p align="center"><i>Made with 💜 by <a href="https://typovrak.tv">typovrak</a></i></p>
