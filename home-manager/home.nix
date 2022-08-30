{ config, pkgs, ... }:

{
  home.username = "davidnuon";
  home.homeDirectory = "/home/davidnuon";

  home.stateVersion = "22.05";
  programs.home-manager.enable = true;
  
  programs.git = {
    enable = true;
    userName = "davidnuon";
    userEmail = "davidnuongm@gmail.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
