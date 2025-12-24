{ config, lib, pkgs, ... }:

{
  imports =
  [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "subtelpox";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Winnipeg";

  services.displayManager.ly.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  users.users.limebot = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    neovim
    wget
    foot
    kitty
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";

}
