{ config, pkgs, ... }:

{
  home.username = "limebot";
  home.homeDirectory = "/home/limebot";
  home.stateVersion = "25.11";
  programs.git.enable = true;
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
    };
  };
}
