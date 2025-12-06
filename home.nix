{ config, pkgs, ... }:

{
  home.username = "arshes";
  home.homeDirectory = "/home/arshes";
  programs.git.enable = true;
  home.stateVersion = "25.11";
  programs.zsh = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, bitch";
    };
  };
}
