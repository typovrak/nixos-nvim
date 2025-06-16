{ config, pkgs, ... }:

let
	username = config.username;
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.nvim = ''
		mkdir -p ${home}/.config
		chown ${username}:${group} ${home}/.config
		chmod 700 ${home}/.config

		rm -rf ${home}/.config/nvim
		mkdir ${home}/.config/nvim
		chown ${username}:${group} ${home}/.config/nvim
		chmod 700 ${home}/.config/nvim

		cp ${./init.lua} ${home}/.config/nvim/init.lua
		chown ${username}:${group} ${home}/.config/nvim/init.lua
		chmod 600 ${home}/.config/nvim/init.lua

		mkdir ${home}/.config/nvim/lua
		chown ${username}:${group} ${home}/.config/nvim/lua
		chmod 700 ${home}/.config/nvim/lua

		mkdir ${home}/.config/nvim/lua/plugins
		chown ${username}:${group} ${home}/.config/nvim/lua/plugins
		chmod 700 ${home}/.config/nvim/lua/plugins

		cp ${./catppuccin.lua} ${home}/.config/nvim/lua/plugins/catppuccin.lua
		chown ${username}:${group} ${home}/.config/nvim/lua/plugins/catppuccin.lua
		chmod 600 ${home}/.config/nvim/lua/plugins/catppuccin.lua

		cp ${./blink.lua} ${home}/.config/nvim/lua/plugins/blink.lua
		chown ${username}:${group} ${home}/.config/nvim/lua/plugins/blink.lua
		chmod 600 ${home}/.config/nvim/lua/plugins/blink.lua

		cp ${./conform.lua} ${home}/.config/nvim/lua/plugins/conform.lua
		chown ${username}:${group} ${home}/.config/nvim/lua/plugins/conform.lua
		chmod 600 ${home}/.config/nvim/lua/plugins/conform.lua

		cp ${./gitsigns.lua} ${home}/.config/nvim/lua/plugins/gitsigns.lua
		chown ${username}:${group} ${home}/.config/nvim/lua/plugins/gitsigns.lua
		chmod 600 ${home}/.config/nvim/lua/plugins/gitsigns.lua

		cp ${./lazydev.lua} ${home}/.config/nvim/lua/plugins/lazydev.lua
		chown ${username}:${group} ${home}/.config/nvim/lua/plugins/lazydev.lua
		chmod 600 ${home}/.config/nvim/lua/plugins/lazydev.lua

		cp ${./nvim-lspconfig.lua} ${home}/.config/nvim/lua/plugins/nvim-lspconfig.lua
		chown ${username}:${group} ${home}/.config/nvim/lua/plugins/nvim-lspconfig.lua
		chmod 600 ${home}/.config/nvim/lua/plugins/nvim-lspconfig.lua

		cp ${./nvim-treesitter.lua} ${home}/.config/nvim/lua/plugins/nvim-treesitter.lua
		chown ${username}:${group} ${home}/.config/nvim/lua/plugins/nvim-treesitter.lua
		chmod 600 ${home}/.config/nvim/lua/plugins/nvim-treesitter.lua

		cp ${./telescope.lua} ${home}/.config/nvim/lua/plugins/telescope.lua
		chown ${username}:${group} ${home}/.config/nvim/lua/plugins/telescope.lua
		chmod 600 ${home}/.config/nvim/lua/plugins/telescope.lua

		cp ${./todo-comments.lua} ${home}/.config/nvim/lua/plugins/todo-comments.lua
		chown ${username}:${group} ${home}/.config/nvim/lua/plugins/todo-comments.lua
		chmod 600 ${home}/.config/nvim/lua/plugins/todo-comments.lua

		cp ${./which-key.lua} ${home}/.config/nvim/lua/plugins/which-key.lua
		chown ${username}:${group} ${home}/.config/nvim/lua/plugins/which-key.lua
		chmod 600 ${home}/.config/nvim/lua/plugins/which-key.lua

		cp ${./guess-indent.lua} ${home}/.config/nvim/lua/plugins/guess-indent.lua
		chown ${username}:${group} ${home}/.config/nvim/lua/plugins/guess-indent.lua
		chmod 600 ${home}/.config/nvim/lua/plugins/guess-indent.lua

		cp ${./oil.lua} ${home}/.config/nvim/lua/plugins/oil.lua
		chown ${username}:${group} ${home}/.config/nvim/lua/plugins/oil.lua
		chmod 600 ${home}/.config/nvim/lua/plugins/oil.lua
	'';
	
	environment.systemPackages = with pkgs; [
		vim
		neovim
		xclip
		copyq
		fzf
		go
		rustup
		python3
		ruby
	];

	programs.nix-ld.enable = true;
}
