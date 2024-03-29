# -------------------------------- #
# -- Home Manager Configuration -- #
# -------------------------------- #

{ config, pkgs, lib, ... }:

let
  # Nix User Repository
  nur = import (builtins.fetchTarball {
    url    = "https://github.com/nix-community/NUR/archive/master.tar.gz";
    sha256 = "0my2286bzk8jhmhjvas61fbk31p43s3xd3rz4q6qc5vl1afd3641";
  }) { inherit pkgs; };

  # GTK Themes
  catppuccin-gtk = with pkgs; callPackage ../../pkgs/catppuccin-gtk.nix { };

  # Colorscheme
  colors      = import ./theme/tokyonight.nix {};
in

{
  # Enable some useful programs.
  # Allows Home Manager to administer itself.
  programs.home-manager.enable = true;
  programs.mpv.enable          = true;

  # Program Configurations
  # ----------------------
  imports = [
    # Terminal Emulators
    # I use tym, you may still add whichever of the following 
    # on top of that by just uncommenting them.
    # ( import ./config/terms/alacritty  { inherit colors; } )
    # ( import ./config/terms/kitty      { inherit colors; } )
    # ( import ./config/terms/wezterm    { inherit colors; } )

    # Terminal Apps
    ( import ./config/shell/zsh        { inherit config; } )
    # ( import ./config/shell/nvim       { inherit pkgs colors; } )
    ( import ./config/shell/htop       { inherit config; } )
    ( import ./config/shell/lf         { } )

    # GUI Apps
    # ( import ./config/utils/rofi       { inherit config colors; } )
    ( import ./config/utils/zathura    { inherit colors; } )
    ( import ./config/browser/firefox  { inherit colors nur; } )
    ( import ./config/browser/discocss { inherit colors; } )

    # Music
    ( import ./config/music/mpd        { inherit config; } )
    ( import ./config/music/ncmpcpp    { inherit config; } )
    ( import ./config/utils/yt-dlp     { } )

    # Miscelaneous
    ( import ./config/xresources.nix   { inherit colors; } )
    ( import ./config/utils/picom      { inherit colors; } )
  ];
  # xdg.configFile.awesome.source = ./config/awesome;

  # GTK Configuration
  # -----------------
  gtk = {
    enable     = true;
    gtk3.extraConfig.gtk-decoration-layout = "menu:";
    theme.name = "Catppuccin-Macchiato-Standard-Yellow-Dark";
    iconTheme  = with pkgs; {
      name    = "Papirus-Dark";
      package = papirus-icon-theme;
    };
  };

  home = {
    # Package Installations
    # ---------------------
    packages = with pkgs; [
      # rice utils
      gnome.gucharmap gpick
      # image editing & viewing
      gimp inkscape viewnior feh
      # music control
      playerctl tageditor
      # general utilities
      unstable.tym cinnamon.nemo usbimager

      # gayming
      unstable.prismlauncher

      # gtk themes
      catppuccin-gtk
    ];

    # Environment Variables
    # ---------------------
    sessionVariables = {
      EDITOR        = "${pkgs.emacs}/bin/emacs";
      BROWSER       = "${pkgs.firefox}/bin/firefox";
      XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
    };
    sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];

    # Files
    # -----
    file = {
      ".icons/default".source = "${pkgs.phinger-cursors}/share/icons/phinger-cursors";
      ".local/bin/fetch" = {
        executable = true;
        text       = import ./bin/fetch.nix { };
      };
      ".local/bin/panes" = {
        executable = true;
        text       = import ./bin/panes.nix { };
      };

      # Lua everything
      ".config/tym/config.lua" = {
        text       = import ./config/terms/tym { inherit colors; };
      };
      ".config/hilbish/init.lua" = {
        text       = import ./config/shell/hilbish { };
      };
    };
  };

  # XDG Configuration
  # -----------------
  xdg = {
    enable   = true;
    userDirs = {
      enable   = true;
      pictures = "${config.home.homeDirectory}/Pictures";
      music    = "${config.home.homeDirectory}/Music";
    };
  };
}
