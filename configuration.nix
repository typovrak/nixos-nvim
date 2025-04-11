{ config, pkgs, ... }:

let
	username = "typovrak";
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
	'';
	
	environment.systemPackages = with pkgs; [
		vim
		neovim
		xclip
		copyq
	];
}
