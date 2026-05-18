# _xfce.nix
{ lib, config, pkgs, ... }:
{
 config = {
  programs.git = {
	enable = true;
	config = {
		user = {
			name = "guilherme";
			email = "thedrawnator@gmail.com";
		};
		init.defautBranch = "main";
	};
  };
  environment.systemPackages = with pkgs; [ 
    gh 
  ];  
 };
}

