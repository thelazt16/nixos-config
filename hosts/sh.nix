{ config, pkgs, ... }:
let 
  myShellAliases = {
    ll = "ls -l";
    lla = "ls -la";
    ".." = "cd";
    rebuild-system = "sudo nixos-rebuild switch --flake ~/mysystem";
    rebuild-home = "home-manager switch --flake ~/mysystem";
  };
in
{ 
  programs.bash = {
    enable = true;
    shellAliases = myShellAliases;
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = myShellAliases;
  };

  programs.starship.enable = true;
  programs.atuin.enable = true;
  programs.zoxide.enable = true;
  home.file = {
    # i.e. is for zsh manager directory
    # example at https://youtu.be/FcC2dzecovw?t=213
    # https://youtu.be/IiyBeR-Guqw?t=1796
    ".zshrc".source = ../configs/.zshrc;
  };
}