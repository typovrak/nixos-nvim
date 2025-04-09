# nixos-nvim

nixos-nvim = fetchGit {
	url = "https://github.com/typovrak/nixos-nvim.git";
	ref = "main";
};

(import "${nixos-nvim}/configuration.nix")
