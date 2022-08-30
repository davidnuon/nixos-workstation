sync-all: sync-home sync-config

sync-home:
	cp $$HOME/.config/nixpkgs/home.nix ./home-manager

sync-config:
	cp /etc/nixos/configuration.nix ./nixos-configuration/


backup-all: backup-home backup-config

backup-home:
	mkdir -pv ./home-manager/backups/
	cp $$HOME/.config/nixpkgs/home.nix ./home-manager/backups/home-`date +%s`.nix

backup-config:
	mkdir -pv ./nixos-configuration/backups/
	cp /etc/nixos/configuration.nix ./nixos-configuration/backups/configuration-`date +%s`.nix

install-all: install-home install-config

install-home: backup-home
	cp ./home-manager/home.nix $$HOME/.config/nixpkgs/home.nix 

install-config: backup-config
	sudo cp ./nixos-configuration/configuration.nix /etc/nixos/configuration.nix
