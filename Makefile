sync-all: sync-home sync-config

sync-home:
	cp $$HOME/.config/nixpkgs/home.nix ./home-manager

sync-config:
	cp /etc/nixos/configuration.nix ./nixos-configuration/
