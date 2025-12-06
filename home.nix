{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/niri-config/config";
  create_symlink = path: config.lib.file.mkOutofStoreSymlink path;
  configs = {
    niri = "niri";
    fuzzel = "fuzzel";
    starship = "starship";
  };
in

{
    # Iterate over xdg configs and map them accordingly
    xdg.configFile = builtins.mapAttrs (name: subpath: {
        source = create_symlink "${dotfiles}/${subpath}";
        recursive = true;
    }) configs;

}

{
  home.username = "arshes";
  home.homeDirectory = "/home/arshes";
  programs.git.enable = true;
  programs.fuzzel.enable = true;
  programs.swaylock.enable = true;
  home.stateVersion = "25.11";
  programs.zsh = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, bitch";
    };
  };
}
