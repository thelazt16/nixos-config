{ config, pkgs, ... }:

{
  imports = [
    ./sh.nix
  ];
  
  home.username = "zev";
  home.homeDirectory = "/home/zev";
  home.stateVersion = "24.05"; # The version home-manager installed. Used for backward compatibility.
  
  # targets.genericLinux.enable = true; ENABLE IF ON NON NIXOS
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  home.packages = with pkgs; [
    mpv
    smplayer
    alacritty
    vscode
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    xarchiver
    fastfetch
    
    # blings
    # lxappearance
    nwg-look
    libsForQt5.qtstyleplugin-kvantum
    qt5ct
    qt6ct
    tokyonight-gtk-theme
    catppuccin-qt5ct
    (catppuccin-kvantum.override {
      accent = "Mauve";
      variant = "Mocha";
    })
    bibata-cursors
    nerdfonts
  ];

  home.sessionVariables = {
    # EDITOR = "nvim";
  };
  
  home.file = {
    # i.e. is for zsh manager directory
    # example at https://youtu.be/FcC2dzecovw?t=213
    # https://youtu.be/IiyBeR-Guqw?t=1796
  };
  
  
  programs.home-manager.enable = true; # Let Home Manager install and manage itself
  
  programs.git = {
    enable = true;
    userName = "thelazt16";
    userEmail = "thelazt16@gmail.com";
    # aliases = {
    #   pu = "push";
    #   co = "checkout";
    #   cm = "commit";
    # };
  };
  
  gtk = {
    enable = true;
    theme.name = "TokyonightDark-BL";
    cursorTheme.name = "Bibata-Modern-Ice";
    iconTheme.name = "Papirus-Dark";
    gtk3.bookmarks = let
        home = config.home.homeDirectory;
      in [
        "file://${home}/Desktop"
        "file://${home}/Documents"
        "file://${home}/Downloads"
        "file://${home}/Music"
        "file://${home}/Pictures"
        "file://${home}/Videos"
        # "file://${home}/Work"
        # "file://${home}/Projects"
        # "file://${home}/Vault"
        # "file://${home}/School"
        "file://${home}/.config configs"
        "file:///mnt/libraries Libraries"
        "file:///mnt/downloads Downloads"
        "file:///mnt/libraries/Downloads/Series%20and%20Movies Series and Movies"

      ];
  };
  
  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "code.desktop" ];
    "application/pdf" = [ "firefox.desktop" ];
    "image/*" = [ "feh.desktop" ];
    "video/png" = [ "smplayer.desktop" ];
    "video/jpg" = [ "smplayer.desktop" ];
    "video/*" = [ "smplayer.desktop" ];
  };
  
  # TODO: check nix-color
  # TODO: modularize your config https://youtu.be/Qull6TMQm4Q 
  # Module Types https://youtu.be/Qull6TMQm4Q?t=583
  # Hyprland https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme
  # col_active_border = $c0 $ca $c3 $c2 $c1 $c0 90deg
    
}
