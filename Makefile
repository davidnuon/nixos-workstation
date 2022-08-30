sync-all: sync-home sync-config

sync-home:
	cp $$HOME/.config/nixpkgs/home.nix ./home-manager

sync-config:
	cp /etc/nixos/configuration.nix ./nixos-configuration/


install-all: install-home install-config

install-home:
	cp ./home-manager/home.nix $$HOME/.config/nixpkgs/home.nix 

install-config:
	sudo cp ./nixos-configuration/configuration.nix /etc/nixos/configuration.nix
